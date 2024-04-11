# xinhua = {
#     '麓': '山脚下',
#     '路': '道，往来通行的地方；方面，地区：南～货，外～货；种类：他俩是一～人',
#     '蕗': '甘草的别名',
#     '潞': '潞水，水名，即今山西省的浊漳河；潞江，水名，即云南省的怒江'
# }
# print(xinhua)
# print('hello world')
# print("你好，世界！")
# items1 = [35, 12, 99, 68, 55, 35, 87]
# items2 = ['Python','wizard','Python', 'Java', 'Go', 'Kotlin']
# items3 = [100, 12.3, 'Python', True]
# print(items1)  # [35, 12, 99, 68, 55, 35, 87]
# print(items2)
# print(items3)  # [100, 12.3, 'Python', True]
# # if 'Python' in items2:
# #     items2.remove('Python')
# print(items2)
# print(items2.index('Python'))

# scores = [[95, 83, 92], [80, 75, 82], [92, 97, 90], [80, 78, 69], [65, 66, 89]]
# print(scores[0])
# print(scores[0][1])


# name = "Alice"
# age = 25
# print(f"My name is {name} and I am {age} years old.")

def calc(*args, **kwargs):
    items = list(args) + list(kwargs.values())
    result = 0
    for item in items:
        if type(item) in (int, float):
            result += item
    return result

print("goodbye world!")
