import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_bloc.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_event.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_state.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/widgets/comment_tile.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreenUI extends StatefulWidget {
  final String docId;
  final String title;
  CommentScreenUI({super.key, required this.docId, required this.title});

  @override
  State<CommentScreenUI> createState() => _CommentScreenUIState();
}

class _CommentScreenUIState extends State<CommentScreenUI> {
  final _commentController = TextEditingController();
  @override
  void initState() {
    context.read<CommentBloc>().add(LoadCommentsEvent(docId: widget.docId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: widget.title),
      body: BlocListener<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CommentAddedState) {
            context
                .read<CommentBloc>()
                .add(LoadCommentsEvent(docId: widget.docId));
            context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
          }
          if (state is CommentDeletedState) {
            context
                .read<CommentBloc>()
                .add(LoadCommentsEvent(docId: widget.docId));
            context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: _screenSize.width * 0.1,
              right: _screenSize.width * 0.1,
              bottom: _screenSize.width * 0.05),
          child: Column(
            children: [
              Text(
                'Comments',
                style: titleMidiumTextStyle(_screenSize.width)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: _screenSize.width * 0.05,
              ),
              BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is CommentsOnPostState) {
                    return Expanded(
                      // height: _screenSize.width * 0.6,
                      child: state.comments.isEmpty
                          ? Center(
                              child: Text(
                                'No Comments',
                                style: titleSmallTextStyle(_screenSize.width),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.comments.length,
                              itemBuilder: (BuildContext context, int index) {
                                return commentTile(
                                    context,
                                    index,
                                    _screenSize.width,
                                    state.comments[index].commentedBy,
                                    state.comments[index].comment,
                                    widget.docId,
                                    state.comments[index].commentId,state.comments[index].dateTime);
                              }),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  );
                },
              ),
              Row(
                children: [
                  SizedBox(
                      width: _screenSize.width * 0.68,
                      child: TextField(
                        controller: _commentController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: baseColor),
                        cursorColor: baseColor,
                        decoration: InputDecoration(
                            hintText: 'Add your Comment',
                            hintStyle: TextStyle(color: baseColor),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: baseColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: baseColor))),
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<CommentBloc>().add(
                            PostCommentButtonClikedEvent(
                                docId: widget.docId,
                                comment: _commentController.text,dateTime: DateTime.now()));
                      },
                      icon: Icon(
                        Icons.check,
                        color: secondaryColor,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
