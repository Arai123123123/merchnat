/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Chat type in your schema. */
@immutable
class Chat extends Model {
  static const classType = const _ChatModelType();
  final String id;
  final String? _chatTime;
  final String? _content;
  final String? _sender;
  final String? _reciever;
  final bool? _isread;
  final String? _subject;
  final String? _sendername;
  final String? _imagekey;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get chatTime {
    return _chatTime;
  }
  
  String? get content {
    return _content;
  }
  
  String? get sender {
    return _sender;
  }
  
  String? get reciever {
    return _reciever;
  }
  
  bool? get isread {
    return _isread;
  }
  
  String? get subject {
    return _subject;
  }
  
  String? get sendername {
    return _sendername;
  }
  
  String? get imagekey {
    return _imagekey;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Chat._internal({required this.id, chatTime, content, sender, reciever, isread, subject, sendername, imagekey, createdAt, updatedAt}): _chatTime = chatTime, _content = content, _sender = sender, _reciever = reciever, _isread = isread, _subject = subject, _sendername = sendername, _imagekey = imagekey, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Chat({String? id, String? chatTime, String? content, String? sender, String? reciever, bool? isread, String? subject, String? sendername, String? imagekey}) {
    return Chat._internal(
      id: id == null ? UUID.getUUID() : id,
      chatTime: chatTime,
      content: content,
      sender: sender,
      reciever: reciever,
      isread: isread,
      subject: subject,
      sendername: sendername,
      imagekey: imagekey);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chat &&
      id == other.id &&
      _chatTime == other._chatTime &&
      _content == other._content &&
      _sender == other._sender &&
      _reciever == other._reciever &&
      _isread == other._isread &&
      _subject == other._subject &&
      _sendername == other._sendername &&
      _imagekey == other._imagekey;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Chat {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("chatTime=" + "$_chatTime" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("sender=" + "$_sender" + ", ");
    buffer.write("reciever=" + "$_reciever" + ", ");
    buffer.write("isread=" + (_isread != null ? _isread!.toString() : "null") + ", ");
    buffer.write("subject=" + "$_subject" + ", ");
    buffer.write("sendername=" + "$_sendername" + ", ");
    buffer.write("imagekey=" + "$_imagekey" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Chat copyWith({String? id, String? chatTime, String? content, String? sender, String? reciever, bool? isread, String? subject, String? sendername, String? imagekey}) {
    return Chat._internal(
      id: id ?? this.id,
      chatTime: chatTime ?? this.chatTime,
      content: content ?? this.content,
      sender: sender ?? this.sender,
      reciever: reciever ?? this.reciever,
      isread: isread ?? this.isread,
      subject: subject ?? this.subject,
      sendername: sendername ?? this.sendername,
      imagekey: imagekey ?? this.imagekey);
  }
  
  Chat.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _chatTime = json['chatTime'],
      _content = json['content'],
      _sender = json['sender'],
      _reciever = json['reciever'],
      _isread = json['isread'],
      _subject = json['subject'],
      _sendername = json['sendername'],
      _imagekey = json['imagekey'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'chatTime': _chatTime, 'content': _content, 'sender': _sender, 'reciever': _reciever, 'isread': _isread, 'subject': _subject, 'sendername': _sendername, 'imagekey': _imagekey, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CHATTIME = QueryField(fieldName: "chatTime");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField SENDER = QueryField(fieldName: "sender");
  static final QueryField RECIEVER = QueryField(fieldName: "reciever");
  static final QueryField ISREAD = QueryField(fieldName: "isread");
  static final QueryField SUBJECT = QueryField(fieldName: "subject");
  static final QueryField SENDERNAME = QueryField(fieldName: "sendername");
  static final QueryField IMAGEKEY = QueryField(fieldName: "imagekey");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Chat";
    modelSchemaDefinition.pluralName = "Chats";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.CHATTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.CONTENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.SENDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.RECIEVER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.ISREAD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.SUBJECT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.SENDERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Chat.IMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ChatModelType extends ModelType<Chat> {
  const _ChatModelType();
  
  @override
  Chat fromJson(Map<String, dynamic> jsonData) {
    return Chat.fromJson(jsonData);
  }
}