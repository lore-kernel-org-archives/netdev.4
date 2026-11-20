Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147905;
	b=vF1I1gnYADglpoW/LtePvOOfVrPJTM+jvznUqshP81AyWi+btwzba+PbR6Lr5cDZCsn1
	 10WxGYxW0eeLApVEk3ANVKG3uMHsf3z1SaawHI+L16wxea2zwyTPwslfBAXufF2uPirEJ
	 xKkIAeGm35n+4YcXqJlH43WI/Aa6fXcUziE9d2jaAc0v8tAnjJnPYL6GCWb9TtVqeEjZz
	 Hgyyk9hCgcytdrU78aehp0duP5eKsuJjEQD6FpeGX8NanYYITiu4f7RXYpLnBLZ4JWH5v
	 ZAB71b6pklCrcv+bOtSv32OzSHoYq2ILJCp1N6mKOLuNGne9e+s4H6HL5WH43MWJVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147905;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=1KipBeg4bEBACcMpYCXGhCQsswY5pv2jIIeEp+mXN6o=;
	b=bzcG+uQDcLGk2oVJTg6kpCzQwNLmbfIpW5VxMfhPErMOWmy+NfqMX8xZ2ThlxQDBoZIU
	 WDaphgkYaoWBBffKiZ0SNAvcdx7lE1ZRXJ9aSqgsIyRWxFMVs6WaPCvQbHw/Vt7u4qrNJ
	 4meXmMKIXQaLd7K4C+qGm2YQaI5ZcziJt7TZ3mlqKSCjBVoL7AvBXLEnLWpamOOPpcOBi
	 L3XzOx4Y24Fn74W3ZBT8cpe6ADZxVH5IQ149JGUaYssTRuPT0ve3mXJGiiQxkiNydb+sJ
	 YKgueepExR4M20kgFuRqRFzHuw7cGCPNiZIZGKdWH2ITXxJ4erbqAGI3hESM3BkcWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=MeieaKoH;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8120606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8120606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=MeieaKoH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795147871;
	bh=1KipBeg4bEBACcMpYCXGhCQsswY5pv2jIIeEp+mXN6o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MeieaKoHtJ202+ZQjbcvmHD+vMPJJ5hK3eeZWWRodQ7Q6TYfyfOX6b6WcYtSRSWN0
	 N6F9QiRoFKHfsiilRmIvrarMwIA8Fa061LRPlMNPsN5MDBzBAn+ae8WKPfD+I8beh2
	 NoHz3HM1grY8GqGuLk9Pr+w9qk4DkmzCqM1L2D2s=
X-QQ-mid: esmtpgz13t1795147866t7b901aed
X-QQ-Originating-IP: X39v3b1V1pZr7zv+DHmO9Xhhq+bYP6YnDteibVLxE5E=
Received: from localhost.localdomain ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Nov 2026 12:10:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15957770864087808587
EX-QQ-RecipientCnt: 7
From: Wentao Guan <guanwentao@uniontech.com>
To: edumazet@google.com,
	ncardwell@google.com,
	kuba@kernel.org,
	kuniyu@google.com
Cc: netdev@vger.kernel.org,
	melotti@google.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH net-next v2] tcp: cancel cloned request timers without waiting
Date: Fri, 20 Nov 2026 12:09:55 +0800
Message-ID: <72918C6B4A6E0CC7+20261120040954.57832-2-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.47.3
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nkqq4bFvvULWz95bU5HFK0PE4DBFOQ90leBLHMttQbkaBxAg+wgsCanF
	KKMsG8uv4jDSk8HRWxL99tq3hj+iU36pH7wWr8GmFHZYGhP/tv9swjf4qyFNVYC3ldoJZDx
	GRUqinHKyM/wRGsy+/PTCogPUQnq8ANk3QEBFaek3tv4piEOjJujb1wjRnUwW2E+iLliZnC
	Y5KXfDO8qexKRJ61nqivQbGNNgMT/JRhliGpJggpYpX/OohcZd1k63d2hcMCzFzNk121VIA
	uXsjjKm+VIJuPq9LQYW0nQEHgsD8NaCH23iWKNprgDRAW8CtB5KkTekpPivelPnhI7eFz7T
	cVX6gG6O0QTSBZ/q1bw727lBLNHyi9YqPcl35fbWCOM7XS8D79Hw/+Rd6gHDi+DuXfhqGLc
	j7X+Uk5hjQK/2p6uHV+zSCI1tanQLdGpfnySdRWu5i/Eq55ft9OCjQb+8ggblXgrAhtR/Mh
	03ASLAXlxts827U3KzAggjYrbsd6TF8SJUITXSxrxoTxaotwYgUFjoL1wYaHWmm1gF4zXce
	EVzyNW4XZizgKnjDXquQE6utyMkLqI+m+f7j9mvpNvExwDZwNIynRSGUtVgbGv8IYkLbneS
	nK/aPlq28ZbHw29oU0KqTH4CH5ieWgc7jZOmp3iG7GwweBTAtocuJC9htFg6lOdxQHyWs3e
	cyB/lwcCRDoO2blLSOR5JDjbQjcVhF3o5R2PVvW01vD0xKEC+XARAxuw0n1Z8Wyg0sOcCXi
	d/Q4zMDcfGoLKqdrp+dG0v6JGyPTzKdBXB4j9dJpRZAHUCpMgpQ0hrN7nNx0Edfgg+iA1po
	0sVNTzsMFySaOQBLHFrsHkcG+9oCadP1rJbtwOWXG65DawVWK3zhJdjbBl92oCi1qff2jXr
	evkOok9gkzX5nPcQ4oFmebTo6mr+z7g85scv68wGgUfsTYG2Z8teuF1fz7nBr67SmNNajNZ
	F4dRasCLVPwjsNsLKqopJUpTvvk0eR7Ddfljhrd0YDJUDkv5QC2qaw+/X0y61JzZNjuPR5k
	PBBDF0ABOeI9nU2P2K8gRmUCMxqKlo27LrqHTB721bG6fy5THlN9A4t+a6LN7esFzCyUn4O
	wI89n+rZG4Q
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

When a cloned request is migrated again, its timer has the same lockdep
class as the running request callback. Using timer_delete_sync() through
__inet_csk_reqsk_queue_drop(..., false) can therefore trigger a
recursive-locking splat and disable lockdep.

The clone is unhashed when inet_ehash_insert() fails, so
reqsk_queue_unlink() is a no-op. Its timer is pinned to the current CPU,
allowing it to be cancelled without waiting for its callback. Use
timer_delete() and drop the timer reference directly instead of
synchronously deleting it through the queue helper.

This change depends on the request lifetime changes in 
commit 4e2b3ef19e0e ("inet: reject unhashed sockets during established lookups")
Without them, __reqsk_free() frees nreq immediately and the pending
timer can still trigger a UAF.

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
changlog v1->v2:
 Modify commit message as Kuniyuki Iwashima suggested.
---
---
 net/ipv4/inet_connection_sock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 6c079929e06f6..346d0015a140d 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1121,8 +1121,8 @@ static void reqsk_timer_handler(struct timer_list *t)
 			return;
 
 		if (!inet_ehash_insert(req_to_sk(nreq), req_to_sk(oreq), NULL)) {
-			/* delete timer */
-			__inet_csk_reqsk_queue_drop(sk_listener, nreq, false);
+			if (timer_delete(&nreq->rsk_timer))
+				reqsk_put(nreq);
 			goto no_ownership;
 		}
 
-- 
2.47.3
