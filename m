Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020545;
	b=V4YdeJ+tIG3Jv7+65GNBx+rXmXZ2r8rmG06o5TW+jiPYsraL/mGw38pzDv9zTSA9YpJg
	 +Ocyxld5yVSTBTJO4XN04DvzzgMmHnaVCDSaJVmq4/pxzVuvsbRWFAGcO1/x+q+7MuC3G
	 XAgDqUxZrWrGr5u6oFkWfwdpAb00Vq2quU9aaBc0VYN81I8vz9ra7HdmKSj3xYRefaBo8
	 qUIc4FSzrblPqIc2lkm95jSxgUW3SW2+kjyUsYht7I447bfBeXZ/VBPJD8cXvN011EMxi
	 9fWFAlJq5UpQP1vKdTFTOAooTdqJfii2xP0gd6Q+AZnnV5owoJwq6wvhw6/x1GlaxUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020545;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=hWJN6kDiFcKd52ipYvnXH8YmIUyV9Q/O5bup6RCYzks=;
	b=RnnnRFqlypP7ZHMqzA7FrcJ9PTtjNG9fEjm4n11OFw1T8IAvU1FApdvW4x43oKoGQI0o
	 9tQoKJyPgm1VMX1p4GPlUK0pBQmUqXAisRuE9YXcUBpecY8QdTbjS8eNx0MuPdPaXUSs7
	 5tN/kcUAzKffD//nBJKpAZwG4FJiRCUT4mfUJP8Y4Bw/ZsrJWCmjH3Rgkga5FJSbGop/V
	 +A80O3jw08qpy2OJu/DDgOZ5SMqizvXgLKBfIO/ZCeSohF/7I6KyGhcrMtohKXG0BkU5z
	 P35oIdamcA3cb0YZO7oxInp+du7UTGT94dP59T3qq6O00wcCKzQ6vuO2gAV9n8+ifhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E69606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDn4IT01v1qYMchAg--.6937S3;
	Thu, 19 Nov 2026 00:48:52 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app4 (Coremail) with UTF8SMTPSA id zi_KCgD3553y1v1qtoLWAA--.8705S4;
	Thu, 19 Nov 2026 00:48:50 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [PATCH] net: rxrpc: Release challenge connection ref on abort
Date: Thu, 19 Nov 2026 00:48:08 +0800
Message-ID: <20261118164808.988724-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zi_KCgD3553y1v1qtoLWAA--.8705S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAARs7
X-CM-DELIVERINFO: =?B?hAd9CgXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGfl47zcsfjhtZ+B4RvRe1EMhzHBeCyxAM7zUvenrEF8sY6P
	R4ftDLX+9SzwAxfRPo1UBgVD61hajoPA+xClc2IZ6gTdFpZgo8ILqGuPlH8ACQ==
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1rWrWfCr17Aw1DAFWkuFX_yoW8CrW7pF
	Z0kryfKFWkJrsxJanxAF1kZ3Z8Ar1kJry7J34ruw1rAws5KwnIyFs5t3ZFqrnxGwn7GryU
	Z3W5tanrCF45Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AK
	xVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU2YFCUUUUU

A challenge can abort a connection during validation.  The caller may then
queue the challenge with an extra reference to that connection.  If the
connection worker sees the abort first, it drops the skb without dropping
that reference.

Check the connection state again after validation and release the challenge
reference when an aborted connection discards a queued challenge.

Fixes: 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE")
Assisted-by: Codex:GPT-6
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/conn_event.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 98ad9b51ca2c..bdb762b2fc05 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -249,8 +249,16 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 	int ret;
 
-	if (conn->state == RXRPC_CONN_ABORTED)
+	if (conn->state == RXRPC_CONN_ABORTED) {
+		/* A challenge queued before the abort still owns a conn ref. */
+		if (sp->hdr.type == RXRPC_PACKET_TYPE_CHALLENGE &&
+		    sp->chall.conn) {
+			rxrpc_put_connection(sp->chall.conn,
+					     rxrpc_conn_put_challenge_input);
+			sp->chall.conn = NULL;
+		}
 		return -ECONNABORTED;
+	}
 
 	_enter("{%d},{%u,%%%u},", conn->debug_id, sp->hdr.type, sp->hdr.serial);
 
@@ -486,6 +494,11 @@ bool rxrpc_input_conn_packet(struct rxrpc_connection *conn, struct sk_buff *skb)
 		}
 		if (!conn->security->validate_challenge(conn, skb))
 			return false;
+		if (rxrpc_is_conn_aborted(conn)) {
+			if (conn->completion == RXRPC_CALL_LOCALLY_ABORTED)
+				rxrpc_send_conn_abort(conn);
+			return true;
+		}
 		return rxrpc_post_challenge(conn, skb);
 
 	case RXRPC_PACKET_TYPE_RESPONSE:

