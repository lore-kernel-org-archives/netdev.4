Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561356;
	b=cSI/50R/pX3OCuF0S07wuBX4SfUJtR7PHUmcS1KFyBUndJUsDvu/4SUv+U6zZ4O5brKt
	 yBs0Jvw/nTjh65PeLy9Zu1FuBvvNjB3Upo9mUUeDmHxi2uIXC9mUnFbUN8CGDeqq/8gSP
	 wSQxMIZxQ/j2AW4TiQhupFMLnBUZqAVPgn19cta61RRzBOeryCPHjFzKSlv99aYDAKBH7
	 pb4DmFWTTzwDu6jfm/3XgCI8aXQR7HjnWuGXvfhJutnovM3ztO8yG/KRmtbzJ8lfOexBZ
	 77T+i+soeJYJ6c9EPDCX6V6KvJlesoi+2/FpjNsBAFBxmx4dl6jDDUJX4odMgjQGN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
	b=dE6L+BlvdTD1xIQC1e4Yoe2laySUpv2M4z4SNuYToB+jqRwLiIvfmpVkUtW3O7rOip8G
	 2FQk6Og5tdTtoJgLpA7kIaSra5EDEpkEaxBp6BZBrlo7HXaU3wI1YuFdfydzJ1Rb5l5d0
	 8LGhBYlWnJD78XqBzX26+IkzRjecIM8AwC/TIAGG06BhlyAH46eepYK+AY8jIAwuWAdS3
	 l2et9enJUEQReH+d0Oi8POt5Tspmw7PeYpui3bvH8RmQw2IusEVWQwkS0U9BbFsUe44d6
	 VyFz0Lpys23eF9e+x+/dzhnlRc86psbPt6jd63i7/rgj7oVQBo6rmyqh3t03igV7Mug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xyip/I4C";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B0606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyip/I4C
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so7465137eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561355; x=1796166155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
        b=Xyip/I4CJjOX79oknp9xnxqH8tk7ypjlRD+iGVEGJhXc1Q78Z0uyTgA7aine8/XIdk
         u4cGGtKJxpG5CHBu0FUISUpWRuMSTxqFwiGqnMOgB0J5J282mZWz3MYJpKm6Ui2AnnZn
         QsHovNmRZs6jMvcBr9BQ+uyJ2GWtF1yryusczyPgenGxiO/SScygAAcq0Dq0imjZ7Jce
         wx/x5AVqjyhbNuFwTTKv0J3MYajKHMAo1Z513kotdbsU7rnQX2upFbTYZ+IbRdyVeVMM
         DNDwT1z0nSrpBU9SnaVwzwXSaQNTHxkD/TNtoQvDCWXB1oogCnpD0WKIvTp1zLBPyvYL
         4WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561355; x=1796166155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
        b=0WRB45+1PnZJgTYiDIbMCHsCFwNQaD8y0XvvBQMkS+muRzYf+3ChS/hKVKJQw+BMSC
         hbAT+oM8X+0pMXvQGQaGgmr858+5M4pCod/VUHOcy0mp9hO2yHSfP6oy8WMQ4bzntkuI
         QJa2arwNIKJKZuQybkYNNypM4eFVIrZUNiUsV1clVj+qugDpYtLK66Ysq3eCjxAxjne1
         LId2W1Lny1h2VCzOehuaOq2Euym9uDv6c2G9vLF13Oj1lIPdFVaOFH5mvq7EhLMbTjdf
         DEZfUVQpjg7tAwMMDxqYYC43rrBs3P+birtm6oPi1tGlb5lbZrVJmshd+LgRtbsH/hKJ
         YT5w==
X-Forwarded-Encrypted: i=1; AL+hErH7p50YalYV32S238tYmgaUTtnHkzd5oGaoG4DI18+HbgXmeGC3+gp00hyJNWhUyfjUGV0trAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xfCNSvv22KBJDWAiCzuFp7aeaD5chj5Qj+sMjwT5Tcwejtcwm
	2JREvc0oxZCqNnomYVW4NCQTMm4rmGsDFnM/8s/d/OeTUS4b3hD4GRAc
X-Gm-Gg: AZFdTZdvZY9QyEPoat5TJTRoU/hUDIXfXlOMnD8McEHcLi1bxGIrZ1N4WDs4I8ZvwB/
	W3SHpsBEP6gQjwTBbrr9K3NUA62AOZYlHRmpHZjbGRwdnp0FS69vVnoImlP+QlzQsZzWa95BVWB
	YSO/TNkKHzIyB3TqwovpmPmkJluyzeHfKbXroUDyzvOWXCyU/juLsdTDxkx7UEQ0kFCUm/hgswB
	hSva8LA6JBIph7DHSn35pGZ6DAgoDnAQAsw3vKunMtxVBAETSi7KUiOZCuUcpIO45qRcRY3d98s
	Q1fB3ev/MQ9D+64saOtB6+x5k0NfUTYgaR2xiggumfQiSxhFl6sy66i0lmqdH5lIXzMsDoFHiQS
	r7we+aoFBs3vvjXbR1EiWVcdB8JsvgEC6pgV8AG6TXdSGeI7nGGjOWP18vctWrz1GA/155vBEJo
	TUp0zbmvArXGDcgFaSlIS+ZtMK/dcJw+rh2sUIKq4seO93XzCoW/V8u6mC2tpuN9QbR3zylyl43
	EeU8Vr0ZCF/YKv5/IIpxYJcKjk3+PccYqTYx5MwM3F5bya3GNzvfgtfxYlVBa13Qb32SnyRsipG
	U324M05ipswE6sBmHbkLWJSNxTi4piiRq0M5rGwMH8vs+SiDsA==
X-Received: by 2002:a05:7300:7316:b0:386:c5d3:7300 with SMTP id 5a478bee46e88-386c5d37603mr3417710eec.12.1795561355161;
        Tue, 24 Nov 2026 15:02:35 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm59747187eec.5.2026.11.24.15.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:02:34 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive with sockmap
Date: Wed, 25 Nov 2026 08:02:27 +0900
Message-ID: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
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

A sockmap SK_SKB verdict can remove receive skbs through tcp_read_skb()
without advancing tp->copied_seq. tcp_inq() then reports unread bytes
while sk_receive_queue is empty. Deleting the socket's sockmap entry
does not repair the sequence mismatch.

TCP_ZEROCOPY_RECEIVE uses tcp_inq() before inspecting the native receive
queue. A small request enters tcp_zc_handle_leftover(), where
tcp_recv_skb() can return NULL. A page-sized request can reach the
mapping loop with the same empty queue and dereference a NULL skb.

Check tcp_recv_skb() before using its result in both paths. Also stop
before advancing beyond the last skb in sk_receive_queue. Neither
check consumes data in the sockmap ingress queue.

A custom LLM agent developed by the author found this issue. The author
manually reviewed the root cause and tested the reproducer and fix.
On net/main with KASAN, a privileged SOCKMAP SK_PASS reproducer
triggered NULL dereferences with both small and page-sized requests.
A map-delete variant also triggered the small-request fault. All
completed without a KASAN report after this change. A non-sockmap TCP
baseline still copied one byte. An adapted tcp_mmap -z selftest, with
only its transfer size reduced from 32 GiB to 64 MiB, passed before
and after the fix.

Fixes: e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 net/ipv4/tcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 418842a2dfd9..fa3b4bcbc726 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2072,6 +2072,8 @@ static int tcp_zc_handle_leftover(struct tcp_zerocopy_receive *zc,
 		offset = *seq - TCP_SKB_CB(skb)->seq;
 	} else {
 		skb = tcp_recv_skb(sk, *seq, &offset);
+		if (!skb)
+			return 0;
 		if (TCP_SKB_CB(skb)->has_rxtstamp) {
 			tcp_update_recv_tstamps(skb, tss);
 			zc->msg_flags |= TCP_CMSG_TS;
@@ -2274,10 +2276,14 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			if (skb) {
 				if (zc->recv_skip_hint > 0)
 					break;
+				if (skb_queue_is_last(&sk->sk_receive_queue, skb))
+					break;
 				skb = skb->next;
 				offset = seq - TCP_SKB_CB(skb)->seq;
 			} else {
 				skb = tcp_recv_skb(sk, seq, &offset);
+				if (!skb)
+					break;
 			}
 
 			if (!skb_frags_readable(skb))

base-commit: 37fa509e43ba59d7c329025436e8ea64bdf089d7
-- 
2.43.0

