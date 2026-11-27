Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755071;
	b=BghiXkWnk5HwHt4DwL/ZKEbHK3m9gy2qFrULZ4Cu/LKtE++vbFCoK8Z/MhSsmQd0YUCd
	 uDOZbtchuwjk36Z+6Dmla2aMNuGY3vV6UL6YrKDbdW2ssntSidVi+DRrxDb7giJ/vQ28I
	 YlxW/cq22XxvRtVwQ2Mc4DhRgw4ORKEGIybdTvscDMkpvgxTkfvg3pi1iX9JJfKJh3Jxa
	 Q1efkxUCGade/n4LfBuJqB7qr3rEyqODNHhPI+snJIB/JkTljxM4yILAKbapidA6EDjLc
	 OYGkzRBTZ3n8tZjb8QB6Evhwdtu19myuwB/asYrv6p+VJu03SIMjwUWSptYwYH14oZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r+zl2OxSNHXAEG7sUZ66NUVaTdjkd8Y/67M1UrdLLDo=;
	b=DhHOGZHzPctS1BEQZNC9p0Q8IkDsAJuT2wABXiUijl4j6BxF1FAANReT1h/dQh527Tfv
	 ihjNfkCI8pP+42XaDsuR9teVXqTkyy3JMTlfWKjKLYnTTAp3XBT42yZkkKytvB/yW6zUz
	 dpOPzXdWGcAyAt2o0m31QjGxgPUkiiNqyZbtHwYKozt4Pv9J8fb/GpKIN2VDfEL3+DTXA
	 UkLKT8F9NrTXp9ZVlglMw66sR2iRendLyb4lwVaIMopPczQtbtASS2ga0VvUrJoHNgAWP
	 EPDAhGONF4eniul0eorGp9YKQei/Yf6KbajJWURLZd5Tl5v/XhKQ3EwaehY2aPcEBrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EkFsqC68;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAAC606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EkFsqC68
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fEspHw4t5fpXm+0QjasgULIFVTPbdXf2a8mYT7wPvsY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795755068; v=1; x=1796359868;
 b=EkFsqC68iyBj2nzZZ8hmxzUj7rlknz+eMVG/wncZsqyFxIfeUj9frZHp1YgypKXHHVDh1w5E
 rFj0zbAWpYecww3WgOMqSDB1Cp+veQCpYJbiKJojEHDG2iR/R+3VYjShUCAiwnKzBwukFVD3baW
 0f4cx2kmn43naCzfI7FVTohA=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 520e6476b5f0411c;
	Fri, 27 Nov 2026 04:51:08 +0000
X-Mizu-Trace-ID: 520e6476b5f0411c
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp_metrics: fix zero snd_cwnd_clamp from a half updated entry
Date: Fri, 27 Nov 2026 12:50:58 +0800
Message-ID: <20261127045059.142247-1-jiayuan.chen@linux.dev>
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

tcp_init_metrics() takes snd_cwnd_clamp from the cached TCP_METRIC_CWND
when that metric is locked, i.e. the route has "cwnd lock N".

tcpm_suck_dst() refreshes a cached entry in place. It writes tcpm_lock
first and only then updates TCP_METRIC_CWND from
dst_metric_raw(dst, RTAX_CWND). Readers only hold rcu_read_lock(), so
when an entry that had no cwnd metric (value 0) is refreshed from a
route with a locked cwnd we can have:

  CPU0                                 CPU1
  tcpm_suck_dst()                      tcp_init_metrics()
    WRITE_ONCE(tm->tcpm_lock, val)
                                         tcp_metric_locked(tm, TCP_METRIC_CWND)
                                           -> true
                                         tcp_metric_get(tm, TCP_METRIC_CWND)
                                           -> 0, not updated yet
                                         tp->snd_cwnd_clamp = 0
    tcp_metric_set(tm, TCP_METRIC_CWND,
                   dst_metric_raw(dst, RTAX_CWND))

So tcp_init_metrics() sets snd_cwnd_clamp to 0, which is what commit
363c8c79220d ("net: ipv4: add zero check for snd_cwnd_clamp") tried to
prevent.

With an mdelay() added after the tcpm_lock write to widen the window,
I can hit:

 WARNING: ./include/net/tcp.h:1580 at tcp_init_transfer+0xc16/0xd50
 Call Trace:
  <TASK>
  tcp_finish_connect+0xec/0x2f0
  tcp_rcv_state_process+0x8ae/0x3060
  tcp_v4_do_rcv+0xbe/0x580
  __release_sock+0x1a2/0x1d0
  release_sock+0x133/0x150
  inet_stream_connect+0x5d/0x80
  __sys_connect_file+0xad/0xf0
  __sys_connect+0xa8/0xe0
  __x64_sys_connect+0x42/0x60
  x64_sys_call+0x2554/0x27e0
  do_syscall_64+0xe4/0x470
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  </TASK>

Writing the value before the lock bit does not help, changing the route
the other way (from "cwnd lock N" to no cwnd) then gives the same 0,
since the lock bit and the value are read separately.

Commit 363c8c79220d ("net: ipv4: add zero check for snd_cwnd_clamp")
already rejects a locked cwnd of 0 from the route config, so a 0 here
can only come from a half updated entry. Just ignore it and keep the
current snd_cwnd_clamp, like we already do for TCP_METRIC_SSTHRESH.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
Found by sashiko:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019222531.1073-1-kj2864%40nyu.edu
---
 net/ipv4/tcp_metrics.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index ae551546422f..fe29fd433eb6 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -494,9 +494,11 @@ void tcp_init_metrics(struct sock *sk)
 		goto reset;
 	}
 
-	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
-		tp->snd_cwnd_clamp = min(tcp_metric_get(tm, TCP_METRIC_CWND),
-					 TCP_MAX_SND_CWND);
+	if (tcp_metric_locked(tm, TCP_METRIC_CWND)) {
+		val = tcp_metric_get(tm, TCP_METRIC_CWND);
+		if (val)
+			tp->snd_cwnd_clamp = min(val, TCP_MAX_SND_CWND);
+	}
 
 	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
 	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
-- 
2.43.0

