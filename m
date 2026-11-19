Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057649;
	b=hz4M88t/kE+Q2uPvqJpAOG9UweT/eeC7X5/zx4BgBSfa8otkLSIimmzQPZ4EAtbsvjEM
	 oMu56wmIgvbU5OPXlbgAnysUjlCdkZD40XCw5jx3K31cZZJmac4zkPtOKiuhKW/OUGW9A
	 AhOBYTimX84ikqDkvN/U16L0mFa11QltilMoKyxsL/QXUF5PI5qmQeqKL4EjgsoP1xt0Y
	 U8A2Uj6GwHem2cYYsx94KXhknFfrD1irT1XHCW4JMfvDwBHkkUREAV0S2i6WMyskFSHK/
	 hqjAago0LHUFHCYRydaRpAlPWzfFAtxCDfcMSi93Eo6CJL1rns9WrEjpBxaPzXKTcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057649;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=IdzxIHwvPNhXFWRF/deMgH+tj2xn4z0opwo9u8jxkq0=;
	b=Cwje/d8mUNQQ/e6LJbU4xTK3Zt0YZNE4hHulSHawQyC8zz123M6ri8uJYIt18v3l0jxZ
	 ceiS5YVNNWitXUWZHwwYYoqGeimNGJODGlzQLreHP4+eaNCNC4Cf9ollm9QzYcGLJ3/SU
	 DLQ+qA1ebAy/LBp+Au57tgIoaJqkhbJWT7Ulb6ISzYUYWGEIzwzfv2kvy1t6az6TleNGg
	 IFH9FB/RJRDEVq4hle+tQTYjgdA77mtfY2PH4P90zJMNu+mT5T466Kr0ftmX4c89CX1vu
	 PuxnQtRSO0sWm9tc8XjPG3I6TF1t2q0l4dXmOeEyN6KiOqMlreqpC/ZTuS1WCLvTcuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E794060A2601
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E794060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wDXkj3hZ_5q9BgjAg--.2492S3;
	Thu, 19 Nov 2026 11:07:14 +0800 (CST)
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app2 (Coremail) with UTF8SMTPSA id zC_KCgA3jXvYZ_5qxgzzAA--.10773S4;
	Thu, 19 Nov 2026 11:07:05 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@infradead.org
Subject: [PATCH] net: rxrpc: Validate RxGK security level before allocating context
Date: Thu, 19 Nov 2026 11:06:22 +0800
Message-ID: <20261119030622.1017012-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zC_KCgA3jXvYZ_5qxgzzAA--.10773S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flAAWs8
X-CM-DELIVERINFO: =?B?GZE9rwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGeHpGtDMELJCLEh64ggYXhOADlsr/2nYF2Ow6mehgvIHhLM
	tWUv/Ymvum76TfL/Z2FenxA56WZayqXYq91+Si4TZ8lE+nRajidCoU/v5KYMdA==
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4xJF1DJrWDKFy3Xry8tFc_yoW8uF13pr
	Z09FyfJrn5JFnIkF1kAa1v9F1YkrZ5Wr47CF90v3Wvv3Wktr1Dtr1kKr4q9ry5GFWfGa10
	v3WIqFnIk3ZrCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_GcCE3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG0xvY0x0EwI
	xGrVCF72vEw4AK0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8VMKtUUUUU==

rxgk_init_connection_security() currently stores a generated transport-key
context before validating the token security level.  A rejected level can
therefore leave a context in conn->rxgk.keys[]; a retry overwrites it and
leaks the context and its crypto transforms.  Validate the level first so
failed initialization does not allocate or install a context.

Found by LLM-assisted manual code inspection; not runtime-triggered.
Related upstream fixes include commit 7e1876caa836
("rxrpc: Fix leak of rxgk context in rxgk_verify_response()") and commit
b555912b9b210 ("rxrpc: Fix key parsing memleak").  These analogous fixes
support the allocation-lifetime analysis, but neither covers this path.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Assisted-by: Codex:GPT-6 <codex@openai.com>
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/rxrpc/rxgk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index f9f5a2dc62ed..80fc8bea61a2 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -242,6 +242,16 @@ static int rxgk_init_connection_security(struct rxrpc_connection *conn,
 	conn->security_ix = token->security_index;
 	conn->security_level = token->rxgk->level;
 
+	switch (conn->security_level) {
+	case RXRPC_SECURITY_PLAIN:
+	case RXRPC_SECURITY_AUTH:
+	case RXRPC_SECURITY_ENCRYPT:
+		break;
+	default:
+		ret = -EKEYREJECTED;
+		goto error;
+	}
+
 	if (rxrpc_conn_is_client(conn)) {
 		conn->rxgk.start_time = ktime_get();
 		do_div(conn->rxgk.start_time, 100);
@@ -254,16 +264,6 @@ static int rxgk_init_connection_security(struct rxrpc_connection *conn,
 	conn->rxgk.enctype = gk->krb5->etype;
 	conn->rxgk.keys[gk->key_number & 3] = gk;
 
-	switch (conn->security_level) {
-	case RXRPC_SECURITY_PLAIN:
-	case RXRPC_SECURITY_AUTH:
-	case RXRPC_SECURITY_ENCRYPT:
-		break;
-	default:
-		ret = -EKEYREJECTED;
-		goto error;
-	}
-
 	ret = 0;
 error:
 	_leave(" = %d", ret);
-- 
2.56.1

