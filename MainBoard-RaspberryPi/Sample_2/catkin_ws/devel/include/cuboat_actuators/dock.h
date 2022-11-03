// Generated by gencpp from file cuboat_actuators/dock.msg
// DO NOT EDIT!


#ifndef CUBOAT_ACTUATORS_MESSAGE_DOCK_H
#define CUBOAT_ACTUATORS_MESSAGE_DOCK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace cuboat_actuators
{
template <class ContainerAllocator>
struct dock_
{
  typedef dock_<ContainerAllocator> Type;

  dock_()
    : front(false)
    , back(false)
    , left(false)
    , right(false)  {
    }
  dock_(const ContainerAllocator& _alloc)
    : front(false)
    , back(false)
    , left(false)
    , right(false)  {
  (void)_alloc;
    }



   typedef uint8_t _front_type;
  _front_type front;

   typedef uint8_t _back_type;
  _back_type back;

   typedef uint8_t _left_type;
  _left_type left;

   typedef uint8_t _right_type;
  _right_type right;





  typedef boost::shared_ptr< ::cuboat_actuators::dock_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cuboat_actuators::dock_<ContainerAllocator> const> ConstPtr;

}; // struct dock_

typedef ::cuboat_actuators::dock_<std::allocator<void> > dock;

typedef boost::shared_ptr< ::cuboat_actuators::dock > dockPtr;
typedef boost::shared_ptr< ::cuboat_actuators::dock const> dockConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cuboat_actuators::dock_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cuboat_actuators::dock_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cuboat_actuators::dock_<ContainerAllocator1> & lhs, const ::cuboat_actuators::dock_<ContainerAllocator2> & rhs)
{
  return lhs.front == rhs.front &&
    lhs.back == rhs.back &&
    lhs.left == rhs.left &&
    lhs.right == rhs.right;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cuboat_actuators::dock_<ContainerAllocator1> & lhs, const ::cuboat_actuators::dock_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cuboat_actuators

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cuboat_actuators::dock_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cuboat_actuators::dock_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cuboat_actuators::dock_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cuboat_actuators::dock_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cuboat_actuators::dock_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cuboat_actuators::dock_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cuboat_actuators::dock_<ContainerAllocator> >
{
  static const char* value()
  {
    return "18af02cda392c4965ac929bc70f2313c";
  }

  static const char* value(const ::cuboat_actuators::dock_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x18af02cda392c496ULL;
  static const uint64_t static_value2 = 0x5ac929bc70f2313cULL;
};

template<class ContainerAllocator>
struct DataType< ::cuboat_actuators::dock_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cuboat_actuators/dock";
  }

  static const char* value(const ::cuboat_actuators::dock_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cuboat_actuators::dock_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool front\n"
"bool back\n"
"bool left\n"
"bool right\n"
;
  }

  static const char* value(const ::cuboat_actuators::dock_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cuboat_actuators::dock_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.front);
      stream.next(m.back);
      stream.next(m.left);
      stream.next(m.right);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct dock_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cuboat_actuators::dock_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cuboat_actuators::dock_<ContainerAllocator>& v)
  {
    s << indent << "front: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.front);
    s << indent << "back: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.back);
    s << indent << "left: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.left);
    s << indent << "right: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.right);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CUBOAT_ACTUATORS_MESSAGE_DOCK_H