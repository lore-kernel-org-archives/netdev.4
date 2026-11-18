Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968913;
	b=i8KBnXjOo/ePmyCCAdixKkmfMBzF/rKhVX0JWbevAcYsItWxWX/LpfBGEL5E8qJn6Hk8
	 bqKz/IAqjttDWdFJdNfiB1+T5tI5MFRwVGCqWXuQ/y74Lrbnfm1mYvLP9xMtLaO90Q+1H
	 h7l8oRomUlq9KVqMxm62yU8DShXpqtsy1U1hvj+b9uDSDgSpddKWhQEKb3s9bo/AhNE7r
	 PPUY9d079J5yAXnTapaIx13j6d+7xHoKgWfRZdd9ltzd8f212A/BW0IZoIeF5oE/YAFuq
	 GiuENKRCb3uMw6MuIaOL0UBk/5+j8KxuCuM8svif9T9K+BkiyO9nOL1KZF64eLktbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
	b=1USer3YXAmQbRJFPAHkZYKShcA1jpR2ci9agVi0OcItIS8G79YVToM2RywhcWraIpVeh
	 npSnUgxBKW6z28EwGOLLIXxIXeGw2gQLWJlnzmyDUVDflk711Yt0+iyy/04r6abJBDHET
	 A9eeEdixZTDv+XVFxr+vbKCUlvvxIp9dEJyhOyrZBWTesaAtU+mKib2fC4b0kMtGhuEmx
	 ZU0ZYEUbNy0e1h57YePfOKuZknfWi3elOEz5Yu9O4HPGaYLu6/njndGjhndse6fJ9uklF
	 REeTmxhvBeJfTsPYSpd2lTaFPE/i94tKBmDBEjjjpJExRXZLB/CiUVRae+xNRhjzmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noSpeQOW;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93030606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93030606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noSpeQOW
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so307660a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968912; x=1795573712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
        b=noSpeQOWMnvjMUB6qRG1XQ4bNW0CovOzR4Vock8d8sRNJybt3HCHGEScStRD4rHXQw
         qz60TaqJL5yaoG7l01VvNRfzP3YN1ZG4Ockxhic+KD7NCdgifN0nu/W7rTvARuUm+j9C
         UugLhefh86fBh9EFvt56DLVHm0/6KtbPyKrdZnZU/3dCWq9T3EsNpZrQ6Clhh2VZlC5k
         KmVIaN5kugqEK8xGHodYrAaBq1/LBqURUOvPksHiVpUHVG2HvrVOnxzo90Jl0G6pqXxG
         n4fKFxn90Ayht0MnfjGbVYXAbHSCi0CKmZx0uhpL91VZy6+0RCBtcqznu8iF5PWcVAf3
         eSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968912; x=1795573712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
        b=GiEwwqCwosej2GVw0Zl8KCdAtqa4kR718qxC0Cdg5V/3yY70vul0xI4SI+ImQLRlM6
         w6MgLWJ4vKCkjrydfZbVwpJQKiSrFqu3+nKkDYdEFjqDjAFO1wFc/ON+ZYkhLOP8Prnq
         ElElGsd4yM7Wx7xiUFWsGT+s8UKeMgM/y00DH0nX5Ys7k31PuLrkElPAK2pnwhHSXsav
         83DkJMWy9rWAI06i+w4twi5tXF/zTliq5501IENfWqx9MGzRKiD7AePus9oBDbStkTke
         XojvJEFkqhBnuEGFnWZWkUdtmFjOg8tVZdXGfWAvWrhr/G9S1y4VCkZLr+fP7c8z9fDF
         mMLA==
X-Forwarded-Encrypted: i=1; AL+hErFAMD7X5Wm7wu7nxkhRRDmsiU9EW0nB19WAnqABBqGFj8HV6kYKiVaVYDdaM/gsJbuzjfCdDf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mGqWdDLYdAFUfIRdKVD6nmXs6snyON8s6+tXxUzALeIJmxuyC
	yc+pONnaq59GGgeV6kefF7TeTe/dx76bVzGuSCrDPUt42D1P7QFHTK/Q
X-Gm-Gg: AZFdTZdbBMp7wwT/qz2dGLejh2C7K6LNb4ZYdhzgHiPJiAgvhwFX7pafuY6yjySmvHp
	31oRFkLOjyA/0hqXlFT9doq7tuQdQ6gIA1idQrb/MBX4MO12Hfii0nY2D8BFpbtTcNejZpAMdA+
	QB9e8U63FPE7v/ijooXkJzCzVpqNa1VG4Y8WcWTkq5/E/KeUvkkFPvfYnWmw13zcMYSCkr0t1/V
	QhTUPcDgsN/330nRKzd1WM/Z6GJaFeOOq3MGfwdb6sD/Jr5hicj4dCHCI7oo7E4qnByEQKGx3B3
	LtUAILfDR1qFhKeUmJhqqA664sUJrDkSHJaDT/kqN6XNl9zplHSfnvqf+UadV/r+QXHMpgFmfbt
	Ko93XFK4p14PT5+eMdqddpcTtuuGD3hcnqlLb27ZB56zoEvyFdj+MeNn5vaUN7JUpvvEUTqvd+D
	ieVkfbSbEl7oL1u1U6oe7X8Ua9xsYMx2dmduvMuu7oY5G9+omov3iN//CrRNYR9lsznvM8+af0p
	627dmOPCk5hBEUKF6fFMqSEQKRb/W8iyg2IQiT8mVz5SN2HzaANVYugY5z8InCWQuWPkwS1GgVO
	yWqYLXvmIYdiU2elAfZzDP4jgPLeMEYKkHVnGZVX9TSTuMkgZjtefwKBqgexUxuV8I+iRVORWdK
	nI2iMAvb8KqdGlAFMbGtv7NQ=
X-Received: by 2002:a17:90a:dfc8:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b3d07d410cmr1041938a91.38.1794968911769;
        Tue, 17 Nov 2026 18:28:31 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6700682a91.10.2026.11.17.18.28.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:31 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: packetdrill: add ROCCET RTO test
Date: Wed, 18 Nov 2026 10:28:13 +0800
Message-ID: <20261118022813.9778-3-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118022813.9778-1-zhiqizhangg@gmail.com>
References: <20261118022813.9778-1-zhiqizhangg@gmail.com>
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

Add a packetdrill test for the ROCCET idle restart on RTO.  TLP is
enabled, so the first RTO is affected; the test asserts that
tp->snd_ssthresh stays at the prior cwnd (20) across the first and
second RTOs.

The test fails at the first RTO without the preceding fix
(snd_ssthresh == 10) and passes with it.  A variant with
tcp_early_retrans=0 (no TLP) fails at the second RTO only.

CONFIG_TCP_CONG_ADVANCED and CONFIG_TCP_CONG_ROCCET are added to the
packetdrill config; ROCCET is only visible when advanced congestion
control is enabled.

Test written by Eric Dumazet.

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 .../testing/selftests/net/packetdrill/config  |  2 +
 .../net/packetdrill/tcp_roccet_rto.pkt        | 63 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt

diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
index b7df8bf309..6e012141d5 100644
--- a/tools/testing/selftests/net/packetdrill/config
+++ b/tools/testing/selftests/net/packetdrill/config
@@ -6,6 +6,8 @@ CONFIG_NET_SCH_FIFO=y
 CONFIG_NET_SCH_FQ=y
 CONFIG_SYN_COOKIES=y
 CONFIG_SYSCTL=y
+CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_CUBIC=y
+CONFIG_TCP_CONG_ROCCET=y
 CONFIG_TCP_MD5SIG=y
 CONFIG_TUN=y
diff --git a/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt b/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt
new file mode 100644
index 0000000000..dabaf07f32
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that ROCCET does not take its "restart after idle" path on RTO.
+//
+// An RTO retransmit raises CA_EVENT_TX_START, because all outstanding
+// packets were just marked lost (tcp_packets_in_flight() == 0) while
+// tp->packets_out is not zero. If (now - tp->lsndtime) >= icsk_rto,
+// roccet_cwnd_event_tx_start() used to overwrite the snd_ssthresh
+// that tcp_enter_loss() had just set with TCP_INIT_CWND.
+//
+// TLP is enabled here. The RTO timer is rearmed for a full icsk_rto when
+// the loss probe is sent, and the probe is the last transmit, so the
+// very first RTO is affected.
+
+`./defaults.sh
+./set_sysctls.py /proc/sys/net/ipv4/tcp_slow_start_after_idle=1`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_TCP, TCP_CONGESTION, "roccet", 6) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+  +.1 < . 1:1(0) ack 1 win 511
+   +0 accept(3, ..., ...) = 4
+
+// ROCCET paces its packets: do not expect precise outgoing packets,
+// rely on TCP_INFO instead.
+   +0 write(4, ..., 10000) = 10000
+  +.1 < . 1:1(0) ack 10001 win 511
+   +0 %{ assert tcpi_snd_cwnd == 20, tcpi_snd_cwnd }%
+
+// RTT is 100ms, RTO is ~300ms. Nothing is acked from now on.
+   +0 write(4, ..., 20000) = 20000
+
+// TLP fires ~250ms after the write.
+  +.4 %{
+assert tcpi_ca_state == TCP_CA_Open, tcpi_ca_state
+assert tcpi_total_retrans == 1, tcpi_total_retrans
+}%
+
+// First RTO, ~300ms after the TLP probe.
+// ROCCET is still in LAUNCH state: ssthresh is set to the prior cwnd.
+  +.3 %{
+assert tcpi_ca_state == TCP_CA_Loss, tcpi_ca_state
+assert tcpi_backoff == 1, tcpi_backoff
+assert tcpi_total_retrans == 2, tcpi_total_retrans
+assert tcpi_snd_cwnd == 10, tcpi_snd_cwnd
+assert tcpi_snd_ssthresh == 20, tcpi_snd_ssthresh
+}%
+
+// Second RTO, ~600ms after the first one.
+  +.6 %{
+assert tcpi_ca_state == TCP_CA_Loss, tcpi_ca_state
+assert tcpi_backoff == 2, tcpi_backoff
+assert tcpi_total_retrans == 3, tcpi_total_retrans
+assert tcpi_snd_cwnd == 10, tcpi_snd_cwnd
+assert tcpi_snd_ssthresh == 20, tcpi_snd_ssthresh
+}%
+
+// Reset sysctls
+`/tmp/sysctl_restore_${PPID}.sh`
-- 
2.54.0 (Apple Git-157)


