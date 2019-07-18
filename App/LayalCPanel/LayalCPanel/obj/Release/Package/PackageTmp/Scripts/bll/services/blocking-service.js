/**
 * (ANageeb) Loading Service 
 */
class BlockingService {

    /**
     *  For Block Page
     */
    static block() {
        KTApp.blockPage({
            overlayColor: '#000000',
            type: 'v2',
            state: 'primary',
            message: Token.processing + ' ...'
        });
    };


    /**
     * For Unblcok Page
     */
    static unBlock() {
        KTApp.unblockPage();
    }


    /**
     * For Create New Loading And Return It For You Mange Show || Hide Loading
     */
    static generateLoding() {
        return new KTDialog({ 'type': 'loader', 'placement': 'top center', 'message': Token.loading + ' ...' });
        //   return.show();
        // return.hide();
    }


   

}//end class