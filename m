Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396453;
	b=p7hUrkCBJ24XKnL4Lov2r5JXCoyWoqqJcapYOUjFYS5jcbq3uvFZdDtIh7NGd4ug7Ez5
	 oPNafcJfyXxU2VAtaspA+FiOv7PrvGmj9P9xmpJabgfHNeGeWLBFZdfIZcSI1247exgPE
	 PxgvVAqptfPvUDP7QozRyBDhZGb2mMGxCTOwXmaHdvcOlDx5MLkYnyMFeBzGsoRMSbyZx
	 pnZ+rWI0iC1AEySSg0BfcPfQ00g/x3tGyrtdpKzTrpVISIOh2X+QkKyd/KUa0e0xq/kB7
	 TMsl5Tfi6Y2YUAqjKrAJIypOkAbfqH7iJd507kD2O3yVsPbEJpujUkio23r8fNfvDDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396453;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=I6yOiTQDOMx7xgrbUTonjLgXgnPtkTY8xFHVLWTXSgY=;
	b=pqiO0V2b0dVRnk8n9W9fV9VnpxXUEi5XhtLjnC8G8Ato/UXfmyFh1tBe70mwucJy8/AC
	 zXUi9raKqHOjluNUKCiUHRa6eTc5nV3rnbKTfHNfQcbrLPtoSnTFlCurpMymoox9BTUI8
	 qS0PRVwoZUEiNsl1cxCdIiep8VsRhZ3gtvB6y3Gjqm2qboa47a+gBg0kuTZdvonFwERTz
	 aYRwlQOL16PXIIfskToFsgZyDQdz9EwEojM1y/oHtvg97Gv/P8mRaevubpGtz2OV9BYqQ
	 MlZsBuObyf0WU+HSGMzOp919Dept1geNLKSPk4ojwk8ykXk7thP+bZ8B2t3LqdFXiOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78291606A32D;
	Mon, 23 Nov 2026 01:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78291606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDX7jRhkwNroc4sAg--.11219S3;
	Mon, 23 Nov 2026 09:14:09 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app3 (Coremail) with UTF8SMTPSA id zS_KCgC3CqdgkwNr+K+BAQ--.37450S4;
	Mon, 23 Nov 2026 09:14:09 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: [PATCH net] rxrpc: Bound the OOB challenge queue per connection
Date: Mon, 23 Nov 2026 09:13:20 +0800
Message-ID: <20261123011320.4032340-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgC3CqdgkwNr+K+BAQ--.37450S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAqsA
X-CM-DELIVERINFO: =?B?4xjnygXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGcBqcyijhDw7SXfVbmqB2A4q20OOH9vDaY9MFicGtae2BFE
	fmb2ItgbSrUzSP2K/xkdSR+W6OnPV0BSgrrXxlRutGbGYt9J3uwFfeL9uPxtcQ==
X-Coremail-Antispam: 1Uk129KBj93XoWxury8Jr17ur47Gr4kJF48Xwc_yoWrCF43pa
	90kr93Kr4kXr1fCrZ3Aa18A3Wavw4DW34UGr1Uu3yrAwsag3Z3JF4ktF48XF1UGw4kGrZx
	Zr4Yga98Ca1UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU2YFCUUUUU

rxrpc_notify_socket_oob() adds CHALLENGE packets to the owning socket's
recvmsg_oobq without any limit.  A peer that keeps sending CHALLENGEs on
an existing connection can therefore grow that queue, and the
pending_oobq tree it feeds, without bound if the socket owner never
reads or responds to them.  Each queued skb also holds a reference to
the connection.

A connection cannot make progress until a CHALLENGE is answered, so
there is no point in retaining an arbitrarily deep backlog of them.
Count the outstanding OOB skbs against the connection and drop new
CHALLENGEs once a small limit is reached.  The count is dropped when the
skb is finally freed, whether by the userspace response path, the kernel
OOB API or socket teardown.

Dropping the packet consumes it without sending a reject, so a flood
does not abort the connection; if the application cannot keep up, the
existing call and connection timeouts still apply.

Fixes: 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE")
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/ar-internal.h |  8 ++++++++
 net/rxrpc/conn_event.c  | 20 ++++++++++++++++----
 net/rxrpc/oob.c         |  2 ++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..1eabf1ad5b28 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -534,6 +534,13 @@ struct rxrpc_bundle {
 	struct rxrpc_connection	*conns[4];	/* The connections in the bundle (max 4) */
 };
 
+/*
+ * Maximum number of out-of-band messages that may be queued against a
+ * connection.  A connection cannot make progress while a CHALLENGE is
+ * outstanding, so a deeper queue only represents a peer flooding us.
+ */
+#define RXRPC_OOB_MAX_QUEUED	4
+
 /*
  * RxRPC connection definition
  * - matched by { local, peer, epoch, conn_id, direction }
@@ -575,6 +582,7 @@ struct rxrpc_connection {
 	struct list_head	proc_link;	/* link in procfs list */
 	struct list_head	link;		/* link in master connection list */
 	struct sk_buff_head	rx_queue;	/* received conn-level packets */
+	atomic_t		n_oobq;		/* Number of OOB messages queued */
 	struct page_frag_cache	tx_data_alloc;	/* Tx DATA packet allocation */
 	struct mutex		tx_data_alloc_lock;
 
diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d0..8665e5f7770d 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -436,7 +436,7 @@ static bool rxrpc_post_challenge(struct rxrpc_connection *conn,
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 	struct rxrpc_call *call = NULL;
 	struct rxrpc_sock *rx;
-	bool respond = false, queued = false;
+	bool respond = false, queued = false, drop = false;
 
 	sp->chall.conn =
 		rxrpc_get_connection(conn, rxrpc_conn_get_challenge_input);
@@ -471,13 +471,25 @@ static bool rxrpc_post_challenge(struct rxrpc_connection *conn,
 		return false;
 	}
 
-	if (call)
-		queued = rxrpc_notify_socket_oob(call, skb);
+	if (call) {
+		/* A connection can only make progress by answering one
+		 * CHALLENGE at a time, so don't let a peer pile an unbounded
+		 * number of them up on the socket queue.
+		 */
+		if (atomic_inc_return(&conn->n_oobq) <= RXRPC_OOB_MAX_QUEUED) {
+			queued = rxrpc_notify_socket_oob(call, skb);
+			if (!queued)
+				atomic_dec(&conn->n_oobq);
+		} else {
+			atomic_dec(&conn->n_oobq);
+			drop = true;
+		}
+	}
 	rcu_read_unlock();
 	if (call && !queued) {
 		rxrpc_put_connection(conn, rxrpc_conn_put_challenge_input);
 		sp->chall.conn = NULL;
-		return false;
+		return drop;	/* Silently consume a challenge we dropped. */
 	}
 
 	if (!call)
diff --git a/net/rxrpc/oob.c b/net/rxrpc/oob.c
index c80ee2487d09..a126296866fa 100644
--- a/net/rxrpc/oob.c
+++ b/net/rxrpc/oob.c
@@ -215,6 +215,7 @@ static int rxrpc_respond_to_oob(struct rxrpc_sock *rx,
 
 	switch (skb->mark) {
 	case RXRPC_OOB_CHALLENGE:
+		atomic_dec(&sp->chall.conn->n_oobq);
 		rxrpc_put_connection(sp->chall.conn, rxrpc_conn_put_oob);
 		break;
 	}
@@ -329,6 +330,7 @@ void rxrpc_kernel_free_oob(struct sk_buff *oob)
 
 	switch (oob->mark) {
 	case RXRPC_OOB_CHALLENGE:
+		atomic_dec(&sp->chall.conn->n_oobq);
 		rxrpc_put_connection(sp->chall.conn, rxrpc_conn_put_oob);
 		break;
 	}

