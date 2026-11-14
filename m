Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673608;
	b=eNm7nO9hilePxIiqj+Ak3DRz/1h6MRvm8+BAmQG6v4SaorMgbrueuedxVnVYbTFwcPxx
	 kGwBh60etrrbq1l1KlQ+QkKlPQ0JZpc75r3QpYmznGDQfc/G68P5qa5bisGCC+lUmQka3
	 XAfHWG6E7e2gqDNOiMHzrjwtQZcI2FdBo0mgFzIfdGzkvzvJOvO7hVFPCsCFo3vTmOF+9
	 2IAPr7fOp6TsEgezuo7UPpqYK8qPy+UQsG3Vwnd9xgXs29LiFCRSTjPmAhpLZq0INCD5M
	 m4QtitA9Jkt4imzgt1H1bpPMNkXg7TptsygQHbEpi9QpK3mygpqRbpqZwgHQQDUgTcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
	b=zyjxb2CHxgX8kFej8d66cT9/WxcMZkSkMWBt83xerb3E/34Az4OBeBp6ffXDl++gi4OE
	 nB7WHImBh1Q2RrvpRfcdVY63pKFIS4vg3wReIo7RQPcCXSC6g4UaXf33FU060yv41/xYO
	 XsWObbCUQYH1ohilxuvL6urGAoHoyQLS8kfBBbIygvD0GPyYO3gqulvpnutju3H1wuZnv
	 fimR88IUbuYdp6/BpSSF/WbT1Lk+2VWXvVJmsO7T28Tb9BGjx4bbRqn2wsjYBNtUPEajp
	 lSCXz/NL6xADkAoCFZ8pfOncAnn/0WnkmAyTL4szGkrINj3vAUpjw5q8uCrSr110+Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8E606A88A
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F8E606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1649498a12.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673607; x=1795278407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=SROD+MeKwmsh80X00loselHY8b+ysQjAA2tn3WdeygoatqMviJ+WgcOJRp2EqDwW54
         McL6tvbDuQFlyDfA3R7qrDdDfxusDfoovcotXbq2LjkJfobypAfaX4/GSF3tFvNBQ7U2
         RgDArgKk3ahojSS4MYs2zVJdRbkRxr/n9Oda+0OHcloRNNZknPUXCVu3aBVtfhGsTmWh
         4lsUuWs4J/cB/CQ8iK0TWyAyeiOh+Fs0mMYVJCwiuevSUdPWhB9hvZF5qaDMRTTnCjV9
         FBx0P40XgYKtCsp1k1hZ2LmENj6+Ym8gqmZw+zKp8BPoemHMdEkoBg21YUnt3jeOM8Ui
         6Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673607; x=1795278407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=AN3ftZWKH0qC9jG1HMMbY+hWVZSzrJw7nR0Ohuizxm65UkCQHxyiVlztp6NJRNolYR
         SH8CW4wdTOBN9q0rMZ/nn18qQHw+UjLiIjpEew475LP7NpqVH43Q1tsm846zLUGP9ypL
         lCsLKinYSJwsz9NvNqd5h1wcSHRDyldX1O2KfG/UeLvUoqTDIT5vcTaJAnoOVgv2Khrw
         kie8TCEJDoJNNo1f8IDwVdh4dKW6Itt26lxzUh00a1NAUVCPXYeo0h3ms1T/UMWkxRhF
         +qhhCUn9bTxFSRQHPT6JQFNA6mS1PblGppV7/voxLlWS1S7k7LIJhRh5v+BhfEC157/2
         F85Q==
X-Forwarded-Encrypted: i=1; AL+hErH61LB6pkBHsi9LEvPre7JLthW+/LyQWga+H2pQbzpCN1psAYRcOoq3Nt/WotfAr5Ol0kCzdow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Le9SF/DuG2mhO1CJZmex6cTOA2Du+9HgMzKDyKjPmRGng6GMi
	cYU8p7o/Xaf6Do3LJuH23IQf7T89g1ymIyj6zOPuURXE1wtVnx135hlc
X-Gm-Gg: AYBFou1bG7RNf3okrUAfNejMMhFkpSbqdHsfZTtF82AHkWAR3Xx7vWPB4ZlvaBCKz9q
	Tw7pU4YosbMUrr5HH4Q2MhxRbohIcJ3PPwNDBUrS37psxlTjqoP3zvCZ88uf8XyTD9jBhRxq9Eq
	ZW7l9F7R45LGh8W8Qjz/uNTHeYkCYRi5IjOfMWSWMH/YKxrVJ4Myts61cDhpsveYVVvVmrwxlE2
	xrR8+irm53sNUEagVYWkRrcIAeEt1NO8r3ED64KxUI0FRcepgqKwmce+BpW3m4ieA1zZC9mRfeW
	qOsx9XINPORCGvV4I44QyO771KMAi+S5Y9oKcbh180B0d+eFTqv6qE3twzXqGm7Hg4hE8FUXai/
	Wan0x2vuImv9KpW+7sArgdMRBH5ZXINrrCS8KzDVTgDbIfbmOtmQnYJrSepFxxf1iAZKZ4ToXhE
	lTBIAIbKj9xzeSfFUgciL0tUYANMNdzboWnaQhkclgdTJf6RqBQ8D7QJYMiAjeL1g1REkoJd/L9
	MK1RnAZLpGgxtE2paUVciUqBIryqUsNssiVHJxqruSKnx4PBwCpMblJ14aq30MZ80/MsrAsjuNl
	f5IUsoz5itlWh0j3NlDm2jLFl22Yzpc7/ssqsNjl9S5QD/Lbd7ujGcoCN2BV7F7jJESFnDoe4V7
	/T/czK8WLDE6XSQVn6Ni8o1k86H3wYOAkIgTpkcAmLevyfsaIUXSKGbJRQlDn/WjukSa0iv5dLN
	bCmcYWImQLd26kS5yhspYYz8WSa21ArtuhfJCDjSji
X-Received: by 2002:a17:90b:3f50:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b1b0d984bcmr6359401a91.63.1794673606887;
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Sat, 14 Nov 2026 16:26:31 +0000
Message-ID: <20261114162632.16346-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

When a connected SOCK_DGRAM socket disconnects (e.g. via connect() with
AF_UNSPEC), reconnects to a different peer, or observes a dead peer in
unix_dgram_sendmsg(), unix_dgram_disconnected() purges all unread
datagrams from sk->sk_receive_queue via skb_queue_purge_reason().

Because skb_queue_purge_reason() frees each skb without calling
scm_stat_del(sk, skb), any SCM_RIGHTS file descriptors attached to the
purged skbs remain permanently accounted in u->scm_stat.nr_fds (reported
as scm_fds in /proc/<pid>/fdinfo/<fd>) for the remaining lifetime of the
socket.

Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected(),
splice sk->sk_receive_queue onto a local list under the queue lock, and
call scm_stat_del() before kfree_skb_reason() on each purged skb.

Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/unix/af_unix.c | 59 +++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..990a98330d9c 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -609,6 +609,28 @@ static void unix_write_space(struct sock *sk)
 	rcu_read_unlock();
 }
 
+static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_add(fp->count, &u->scm_stat.nr_fds);
+		unix_add_edges(fp, u);
+	}
+}
+
+static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_sub(fp->count, &u->scm_stat.nr_fds);
+		unix_del_edges(fp);
+	}
+}
+
 /* When dgram socket disconnects (or changes its peer), we clear its receive
  * queue of packets arrived from previous peer. First, it allows to do
  * flow control based only on wmem_alloc; second, sk connected to peer
@@ -616,8 +638,19 @@ static void unix_write_space(struct sock *sk)
 static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
 {
 	if (!skb_queue_empty(&sk->sk_receive_queue)) {
-		skb_queue_purge_reason(&sk->sk_receive_queue,
-				       SKB_DROP_REASON_UNIX_DISCONNECT);
+		struct sk_buff_head tmp;
+		struct sk_buff *skb;
+
+		__skb_queue_head_init(&tmp);
+
+		spin_lock(&sk->sk_receive_queue.lock);
+		skb_queue_splice_init(&sk->sk_receive_queue, &tmp);
+		spin_unlock(&sk->sk_receive_queue.lock);
+
+		while ((skb = __skb_dequeue(&tmp)) != NULL) {
+			scm_stat_del(sk, skb);
+			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
+		}
 
 		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
 
@@ -2058,28 +2091,6 @@ static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
 	       unix_secdata_eq(scm, skb);
 }
 
-static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_add(fp->count, &u->scm_stat.nr_fds);
-		unix_add_edges(fp, u);
-	}
-}
-
-static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_sub(fp->count, &u->scm_stat.nr_fds);
-		unix_del_edges(fp);
-	}
-}
-
 static void unix_orphan_scm(struct sock *sk, struct sk_buff *skb)
 {
 	scm_stat_del(sk, skb);
-- 
2.43.0

