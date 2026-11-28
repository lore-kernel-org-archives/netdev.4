Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835564;
	b=qtR8jQjT4cA2kAOFUtGSx/fDC6XBetHv83o26ipbUNeVsa9d7003D4UWRrwW4L5LbiYt
	 ZnwDumndJ4f0az65IuQYBK4D0Qe2zr6KaFAKjywtpnLCrnD5jckPDx0QM9RxtlsRJFJxD
	 cJtKmGqlpuT9+wpDbAsAQZO5Q60RXPbdnmpd5f1S99heN/czCib1/804ec32dHTTW3MR3
	 5K6U4+KfQCZvkqQT9t7XooMGppPKKSgwerqjbABGyTwIL+t9qIdGpwTOa/gAKvEkyOkMi
	 gp5LIm3IaRr+aEJFZX9X9t2pYhPNO5O3cEAvv55adOXOWS5GAx+Tk/NGhrt9R10l9yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835564;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=ic3YfbvFsVqsHnN8q9STPnVH1vnyk7p9Wsl44ytZ0Y4=;
	b=HbjBDqOmeSumbu/Dx//NjVsc6aAYsaP7dfq4kP4MF0CMSPKeERioyIhQ44F5IJgR6SXv
	 qo84FSlmL62bWwZSI332ARjE2ZAygs+YRUxgm2DNIPgd+r1mIuCU5Wy1IUffktarx7hj9
	 gbi3pwrICiTIp5LXAi/OYNKJhb+FDA92urfzY+fFvS4L/beWB97qnog5VFHBXZtQqQyFY
	 UJN/+ky9EMNyIJPE9Rc9ttkxtztQ5910RkVUOQV7LyYanhwqTfzG4UR7RTIE+yVLM5rSa
	 5G1dmn4WNpi84B/3MxQ3m3OnEqW03FO2D92B/GYO5mD9JHohD6HuLGPSx0sym9IpNfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=WtXhZx9Z;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=sbgqJjvA;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390F8606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=WtXhZx9Z;
	dkim=pass (2048-bit key) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=sbgqJjvA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=gw2610; h=Received:DKIM-Signature:Received:From:
	To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding; bh=ic3YfbvFsVqsHnN8q9STPnVH1vnyk7p9Ws
	l44ytZ0Y4=; b=WtXhZx9ZzJjzEIYrPHLFoCElhZqG9i8ymJCYaTKuoenIlM/LpL
	Tdq3UjOsof3r38LYAy7yJASYZ1YeqYGUuWnlXs7I2dV6w5L5DjVJ849+AY1vYHcV
	OWvuCL4HLA3a5CyobJz14PDhAPd1pBlh18TBCmMP87dWm+xcUQlJPsLto=
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wAXiSmhRgprbbI7Ag--.661S3;
	Sat, 28 Nov 2026 11:12:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=cm2610; h=From:To:Subject:Date:Message-ID; bh=ic
	3YfbvFsVqsHnN8q9STPnVH1vnyk7p9Wsl44ytZ0Y4=; b=sbgqJjvACJ6ZRPAkAl
	4CZOAPNuPFd+WFIjU+pRH+SFZHoZqQzhaZKZyy/nKI/vGPJHW0dp+4hnJTsKo7cO
	IGZv0A7EQ84kua4bnmXxw7iBvYQ+Wc/wSqLzsmwnJ+DJObyzjlS7F2SaeH4UVhAr
	cSucrGcCjIze/YAB/sIhYDvOUpxTuDOAyfszJGM7wRCv2/AiSpm+ml7uG+pJPECH
	C/w72pjXvgju+N1WWSsTHh1/zmZVEAwer8hS7OQeDGRF7sFyBMpAr1lRszhAyqRD
	ecg72iXPwIOWBEwN5ZWUtmy1sflcK0mkP/rRqeI1s+klsQZs6Ug8NYZZ2568Qa4G
	99rQ==
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app1 (Coremail) with UTF8SMTPSA id yy_KCgDn9YKgRgpryik1AQ--.7916S4;
	Sat, 28 Nov 2026 11:12:33 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v2] net: rxrpc: Validate RxGK security level before allocating context
Date: Sat, 28 Nov 2026 11:11:36 +0800
Message-ID: <20261128031136.308303-1-linma@zju.edu.cn>
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
X-CM-TRANSID:yy_KCgDn9YKgRgpryik1AQ--.7916S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flABUs+
X-CM-DELIVERINFO: =?B?ZnFIXQXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGcPcmW7w2L/pCuxWi1lnfyHKu19W3tWI3i6bRPz4jUqbUa1
	u2o+opEOr/eVxSE+bZRtrx2YX2Mfu3rb3sjrVVjpO/8d5h8KHEd20P5zM0DyAQ==
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4xJF17AFW7Jr4UGF47Jrc_yoW5Jr1Upr
	WY9FyfJFZ5JFnIkF4DZan7CayYk398Gr47Cr9093Z5Z3Wktr1qqrn5Kr4j9ry5GrZ3Ga10
	v3WIqFn3C3Wq9wbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IE4IxF12IF4wA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8c4S7UUUUU==

rxgk_init_connection_security() currently stores a generated transport-key
context before validating the token security level.  A rejected level can
therefore leave a context in conn->rxgk.keys[]; a retry overwrites it and
leaks the context and its crypto transforms.  Validate the level before
setting conn->security_ix/conn->security_level or allocating a context.

Found by LLM-assisted manual code inspection; not runtime-triggered.
Related upstream fixes include commit 7e1876caa836
("rxrpc: Fix leak of rxgk context in rxgk_verify_response()") and commit
b555912b9b210 ("rxrpc: Fix key parsing memleak").  These analogous fixes
support the allocation-lifetime analysis, but neither covers this path.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Assisted-by: Codex:GPT-6 <codex@openai.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
v2: Move the security-level check before conn->security_ix and
    conn->security_level are set, so the error path doesn't modify the
    connection state, as suggested by Simon Horman.

Link: https://lore.kernel.org/all/20261119030622.1017012-1-linma@zju.edu.cn/

 net/rxrpc/rxgk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index 77a67ace1d24..a1165ac39566 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -239,6 +239,16 @@ static int rxgk_init_connection_security(struct rxrpc_connection *conn,
 	_enter("{%d,%u},{%x}",
 	       conn->debug_id, conn->rxgk.key_number, key_serial(conn->key));
 
+	switch (token->rxgk->level) {
+	case RXRPC_SECURITY_PLAIN:
+	case RXRPC_SECURITY_AUTH:
+	case RXRPC_SECURITY_ENCRYPT:
+		break;
+	default:
+		ret = -EKEYREJECTED;
+		goto error;
+	}
+
 	conn->security_ix = token->security_index;
 	conn->security_level = token->rxgk->level;
 
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

