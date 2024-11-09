import { IEndPoint, PalmyraTreeStore, TreeQueryStore } from "@palmyralabs/palmyra-wire";
import { AsyncTreeMenu } from "@palmyralabs/rt-forms";


const SideMenu = () => {
    const SideMenuEndPoint: IEndPoint = '/menuData.json';
    const treeStore: TreeQueryStore<any, any> = new PalmyraTreeStore("/data", SideMenuEndPoint, {});

    return <>
        <div>
            <AsyncTreeMenu store={treeStore} />
        </div>
    </>
}

export default SideMenu;