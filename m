Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665602;
	b=4UZkbxLHIaaO7nvx+j8qUOO29IQFDSu4hzP52p506GvlMVMgpwMYjWpZVVqYp9/KN6CQ
	 suBGIUstyhegzQ1DTSE5+IlS9+OaYcqDhVQ9lr2ki1OvC2QqI0yj+S2Y8mpi+g48ndHf7
	 0zgo+6g1wy9T0PjXpucXe1RpWYo+h9hnFu6m26E+ljzm+OZJ1ap2oJoWBU08mpCV8UNRV
	 0qsP6wnF8TPHpyLCniIxwQMFo+DtEfIpKje7v9TKYIfCFyN5MJfEdh8NYc8uw79XU7z0L
	 0jIDkFJOc/ri8BZ5G0LzoW653eESXoeeh72TMw8QYYHEDrXuB8vMT0mJmd1J5gs4XnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
	b=FtIwD7IYwFLRvtIbAB9j96wD8GDjvIjeGrK/1X0wg+q0qhHxSdGhUuaV0js/3vJnWTOM
	 E+dI4WyueyYXTWs75k25kACh4f9tLxLWmIKlzG4JTZo7hLDAHUTzovffKw+/fHVoCf2na
	 /Mimlya0vUXRBFUWhb9L8Y2yAtkDy0MfeMisrEkaXhFXtoWTq5DoeaGzwCbVj0eOhEmnR
	 SdkmQ3DfNbEcZHdJTWh7JO0GlwU4HeUfx1J5KxnrV/NjPCvTsfTLRZust1ytaVh+Vvuvo
	 ibDqJFY1dB4IccD+xT9IYQJslH+Rg8Nu2229jpveTXLFse2qQLDo0T1c4Y2Lmaj8ixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PefjNSwK;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1A606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B1A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PefjNSwK
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9d7791b00so22129265ad.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665601; x=1795270401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
        b=PefjNSwKA83Q9XnZkTR47Rv7Ph8C3n2d81LF7aoXPv/tSDKxDwxbeGFRPLnE5vWK1V
         0uKVkIumRKcpAGAFtMHk/ngx084YRUXyzAfWNB0StBSy0RmYWb494bbHhQFzGzBrq8vF
         0rGOIm6w411b4HzQ+C9PvmoEpUOY5T+QNxZdHDifN10q4EGPAJ2zgkfv2/ODBOGLzzIK
         rC1eU/yIXFfZV37+0HM/1/IQotKbkiQCunu850lBNxrZxjXdidrkHAnt8K/bLmy5Ttux
         X8WuQJPGtWZX4rk/SqwapAFwA6F4KTzwJwFX3etpmU88x7XpEwpQsvCZvKX0ILvaKKvx
         leUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665601; x=1795270401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lYN5cpAnwcvRLwVXKb5jg7Q77SzumSKXZpj2QEfzSE=;
        b=rEu1s2bZmwYZz9se8+YauC0X5iLOLaUC3IUhrxbvyOVgz4sbf67OQP7LliUvgBKdVZ
         Q7IJlCvIXB6iwRO4ShecG6Ur6h1YzbfcUHve3LM7vuLK5bXzTjAxfIVbsQggPBwIonHf
         4j3kdulgyP+LP+uK/5IsAdt624/lLpWIP1A1MLhxvuW1EPsw15eIbTtOM9cOAoT5pbm2
         vfJiMkSwcVR/BdKZlWp7jyxhfrZrnfRRTo4wPt3QK2C3fg+e0CwR0NhGEaIVej4sjp+5
         P+ZPxEmGKQRFmdHcoLBnYNQ0t4ztqeInjO2wQABBjupHdVAG7Ds9FvJBjK7um3L5vB+A
         PFWQ==
X-Forwarded-Encrypted: i=1; AL+hErHEqCuwmlfcaAFYHJOeLk1Uq1AaLJ5WlxXkpPaHhi9UU6PVo52rT2ozSS+v4yxjTt1f/SSWfgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z87P2nVDzHT/XVqSHsCFSVGygPWwBwQ4kNYFKcY/sa4d34Sw9oR
	dkiCXiDVVcsA4LiXsXE/KFfhPslmBJ4AHuFTACBbi/ElnznedqNaQRzA
X-Gm-Gg: AYBFou23YeRicjhYnmor5hPM6QJ5gQsDLWsdw146hxrRJ5Ak/nwF8siudd4de+p0W+c
	g/10bEqaKqnz1LgwBcSKQG9uQsrKNRDhow8wR3nK86JM+pDLyNq8mz9Y31L4119eIIx1VUp5FWy
	nqyBJUDPzaf9pVqzHwbsqH1tYYvvadFcx/WgyyFqjjNdcHkYtPgsRTrFXKpeoNSROHK1H3MZak0
	K1An0SVeNLPuntwKbUX8t4yPFod9+CJtBPgNmaS5vVEGIOyBwUtLGmjMlfuHLJRIW9SaqLbCOtw
	1KoPv+UQ3weRrNLwD15iju4OX4FykxVes+w09VxG7zEsPfDfRJLQBoAeSGqsEL/N6fdDS/EWge7
	+uenkYD56QCY9o6GuUBxGnCs+1iNNLCPKFiUfQfUBlg03CxkDo330qyS048cT4f9U8P8+UUnddE
	bwUr/yKNV+jK7fjJ29oFARHg1cTaR9Lmk92cezuIPVbGeNTF2hkuzV9dSasawfYjFj6/nhvI+A6
	jk3ELnoXCbOpGSuh31KPmVVuRMeICoSTK4iSA6m6V2HeagrdX43tqJ/MUorMLtDrXj2dIUbWBQT
	LaUVhRCa68wwmvh1FMOtEFGRnnSCI8e+XQJFz3xbp/iRbLmMWVvl/wFZ/ZUfDDiVA2RKW8VYiB9
	L
X-Received: by 2002:a17:902:db0c:b0:2ed:b7e4:f52 with SMTP id d9443c01a7336-2ee0dd907f9mr51917735ad.57.1794665601458;
        Sat, 14 Nov 2026 06:13:21 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d9966sm21077595ad.61.2026.11.14.06.13.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:13:21 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: roccet: do not restart from idle on RTO retransmission
Date: Sat, 14 Nov 2026 22:13:15 +0800
Message-ID: <20261114141315.19007-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
early and roccet implements the idle restart in cwnd_event_tx_start().

An RTO retransmission also raises CA_EVENT_TX_START.  tcp_enter_loss()
marks the outstanding packets lost, which drains the in-flight count
while packets_out stays non-zero, and the RTO timer expires at least
icsk_rto after the last send.  The idle restart then overwrites the
snd_ssthresh that roccet_state(TCP_CA_Loss) just set:

  tcp_enter_loss()
    roccet_recalc_ssthresh()       ssthresh = 0.7 * cwnd
    roccet_state(TCP_CA_Loss)      cwnd = TCP_INIT_CWND,
                                   ssthresh = max(ssthresh, cwnd)
  tcp_retransmit_skb()
    tcp_event_data_sent()          CA_EVENT_TX_START
    roccet_cwnd_event_tx_start()   ssthresh = cwnd = TCP_INIT_CWND,
                                   state = LAUNCH

The flow loses the reduced ssthresh and cannot slow start back to the
pre-loss window; CUBIC growth restarts from TCP_INIT_CWND with
last_max_cwnd reset.  Skip the idle restart while packets are
outstanding, matching tcp_slow_start_after_idle_check().

Measured with a loopback sender and 100% netem loss after cwnd reached
about 126, reading TCP_INFO on the sender:

  before fix: ssthresh during RTO = 10 (TCP_INIT_CWND)
  after fix:  ssthresh during RTO = 88 (0.7 * cwnd preserved)

The same issue was raised in the Sashiko review of the initial series.

Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
Link: https://lore.kernel.org/all/179179785248.434549.16829837649351382748@kernel.org/
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---

AI assistance:

- DeepSeek (deepseek-flash) generated the code change.
- I wrote the tests and reviewed the code.
- I wrote the documentation and the changelog, and used DeepSeek to
  polish the wording.

 net/ipv4/tcp_roccet.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
index 04b9e5246..4b4621a79 100644
--- a/net/ipv4/tcp_roccet.c
+++ b/net/ipv4/tcp_roccet.c
@@ -1144,8 +1144,15 @@ static void roccet_cwnd_event_tx_start(struct sock *sk)
 			ca->epoch_start = now;
 	}
 
-	/* After idle periods, go into LAUNCH with slow start */
-	if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
+	/*
+	 * Skip the idle restart when packets are outstanding.  An RTO
+	 * retransmission also raises CA_EVENT_TX_START: loss marking drains
+	 * the in-flight count while packets_out stays non-zero.  Restarting
+	 * there overwrites the snd_ssthresh preserved by roccet_state().
+	 * Cf. tcp_slow_start_after_idle_check().
+	 */
+	if (!tp->packets_out &&
+	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
 	    delta >= inet_csk(sk)->icsk_rto) {
 		tp->snd_ssthresh = tcp_snd_cwnd(tp);
 		tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
-- 
2.54.0 (Apple Git-157)

