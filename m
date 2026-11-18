Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968907;
	b=tx+jipP4r/mkj5XsOWxTbUk6at6SxhbyhbFY6c/jCOsl9JDeUCpLIdn6vkLVJd28v3GO
	 GZ5FlDZDePDaMON6+PvT1S9b9GlLRl7M2TLvRyzOzry94YAaghtULSQUBTEsXcglKVNbr
	 ztMPs4yAWIS8CKILQQp1i1kFfXoV+6JNxVtu4QaLzKewDm7Wxc0fWMW7qu55GKI5Vip+5
	 x8ahdDMrc47q6tsRfnqcq8YHVVkYe9xAL63WX3e0p6WIQCf9sKmXjyatVZoOEe/2gQKk7
	 FG/pF8MD+2IbMJDYKW6ZKUyH1LGrIocKt2igPyFqcTBe1YACsv10JCZ3GJKo7YPNDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
	b=qLo7vSkChij7TVAv6oaHDNvya5aZJ4syG/jeAqwsM6kYqfImslABO7YT4735XS0roJ4/
	 t0NlQjhbaiFZe1Ds/omi1PEs8OWuKesnl2LGc5d5cMKpGrz+ulonYWZQTmdKy6Mc3raqH
	 vOIHmPHJJgp/YiAfFXBoudDqk7+EpFjg7iAE58U8F3W290JBhaSY903GoiNc39Df4RnzK
	 QG64jklZYe7NUUH/1R7SS/Vqu+Ij0l2fyl9w/ZU6113bmJSO+wtWJ9RIjmiL9SiWWPSOl
	 ehd7e6SxwloF4IgR3XLFdg4ySSRW0IKtzR2+GlJ0BIrXAZz0UVMs7WqLUkGur77bsWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C4606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715C4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3282725ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968906; x=1795573706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=cy2Q+XklQ5KqHJHhh/oFJkmh2mqiS/bMvFmsez1b8zvlbdGO1ZLx7dgOmdH7qom5Dr
         kh226ubwjOb6PxOYf68rstZZ1Q2z3P3dyvyIKJnUR3VlFSdRAYXxsoPehePvwxdkhRXs
         DeUEDiCP34ccd7e8hDOHxOS1UfC6z4vlOiBL4j5VrgtcS7XUyUFDo50v3kcsDj7N7KfB
         y1NNU42aTxX7sssOs3AhlJ0viv+klJfxsw4nVVyXxMIi0doOelpjrq1dr6dZoEvBhAZM
         dOuYgQCT1igPRWXDkb8hbj3fKv4+6JCtr4xtv+/khzeHnNepF8f/tYk+kSCentJ9/A3U
         9sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968906; x=1795573706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=Ota4uC34DDZt/k1vw7dd8iBmuFcPaC2zT4EhIi55Jt8lGr5Pi9KomT9XWow+lLJFi/
         tPbANwAqakOIu7uKO38HSv3Yl0iRXRCEp9B62xcUeDPFx6nMjHK1rUzrk5gaExEsECnx
         zhi0pokL2ev6og7vTFMbadkxloIl+iDMF1c13BemUoAFJHkb8kXerTQVcTnKQJEbVv4K
         jtL80z0luOhQGsS2C7sx1hyBfA6t/9zFZy0/TCbaWej9a9IAUPCdGwSj1tI41+o0N0pi
         KArCRwxXE/9uekqUcn/JOLiQBs64/kAeo5FZZcXw4N2OJSbWzqOEm2xrGcKJHZPVVA/+
         NpRw==
X-Forwarded-Encrypted: i=1; AL+hErHQLlKS4f7KXnpyOIoeNS8VxgNewcX4y2iD9x8IOdhXjwh/5WChn6m4Q+LR1h7SSU7L18K2jf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CX/r/PKbSmylGYwrPulR7NuoJuq7OIXnf34tqbOzPYg/S3IMF
	iJT/rcwiZlYgebvsOKzHJeutONi7ckb2POMF0G/L85H3o5kL3vA4bFSL
X-Gm-Gg: AZFdTZeXuS40BXuYbR4FUFWpabyniGFTcVEQd15m7+8N3MoSRutH7zowFWZ4m9DP+0k
	3kZp3rKC0v89q4qz60bGUMUevAcTPk+viaHNIn+M4XJO6pteYkrVXnzf5+E+mpWTm60mZiqMIgT
	883pN9k+6ZapQk0KO0KWh3B2bIriccBqTEmatSaNgbmlTECdlVom0/Q+sBhoEugGF02tVEd/jDZ
	KlWQy7k34ebq59bVk9+hgZ+YnuGPxsYDj01gwgGZqxj9cHy7hZ4yr87++SViC8xo8e+UmffJKYS
	CEy6DpekdprS0Yg3qNgY7QZr7+NrqJsR7Jrikgl/4RGbfqUVhb2AUMC5wgudEBOra1V5ddG0fGe
	xgmTKQ4oPtvKLs16kXxNkvsTFBJKNVGjE8GyPnHykU/X04Cfj9KQX0ITWKt/7wnN92PLJ89mIv6
	v2lwEgGGxKwfoWpPJRz7Ta1hoLjBUPrHAKsPJyNFHuehBxBjFHSIiJsE3uOImrdmADGDQlzuRyl
	zCklOnHwHV33HheA0cRmiZDalsD4ZIWE3VB09eVH0gFSlnXSWBT2GOjLpmrOE2G2b9EC8mvjdqP
	9hCo/cw0sbSAK3a7rKAXXMWcOHdX2E+3REJh/rUqY5T4jX2QVRYPYgJeaw8ddutvqZ8DqxlnNlo
	Jx9P9hhowcnVPpgILhfH1eag=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr12461425ad.57.1794968905750;
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181423sm4715605ad.32.2026.11.17.18.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
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
Subject: [PATCH net v2 1/2] tcp: roccet: do not restart from idle on RTO retransmission
Date: Wed, 18 Nov 2026 10:28:12 +0800
Message-ID: <20261118022813.9778-2-zhiqizhangg@gmail.com>
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

roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
early and roccet implements the idle restart in cwnd_event_tx_start().

An RTO retransmission also raises CA_EVENT_TX_START: tcp_enter_loss()
marks the outstanding packets lost, which drains the in-flight count
while tp->packets_out stays non-zero.  If delta >= icsk_rto,
roccet_cwnd_event_tx_start() then takes the idle restart and overwrites
tp->snd_ssthresh with tcp_snd_cwnd() == TCP_INIT_CWND.

When a TLP probe was sent, the RTO timer is rearmed for a full icsk_rto
at that point and the probe is the last transmit, so the first RTO is
affected.  Without TLP, the first RTO can escape: the timer is armed
when the first packet of the flight is sent, and pacing spreads the
following ones, so now - tp->lsndtime < icsk_rto.  The second RTO is
always affected, since it fires one backed-off icsk_rto after the first
RTO retransmit.

roccet_state(TCP_CA_Loss) calls roccet_reset(), which clears the private
state; ca->state is already LAUNCH and last_max_cwnd is already 0 when
roccet_cwnd_event_tx_start() runs, with or without this fix.  The only
field the idle restart breaks is tp->snd_ssthresh: it overwrites the
value preserved by roccet_state() with TCP_INIT_CWND.

Skip the idle restart while packets are outstanding.  The packetdrill
test in the next patch fails at the first RTO without this fix
(snd_ssthresh == 10) and passes with it.

Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
Link: https://lore.kernel.org/all/179179785248.434549.16829837649351382748@kernel.org/
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 net/ipv4/tcp_roccet.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
index 04b9e52466..1769e4bbe3 100644
--- a/net/ipv4/tcp_roccet.c
+++ b/net/ipv4/tcp_roccet.c
@@ -1144,8 +1144,12 @@ static void roccet_cwnd_event_tx_start(struct sock *sk)
 			ca->epoch_start = now;
 	}
 
-	/* After idle periods, go into LAUNCH with slow start */
-	if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
+	/* After idle periods, go into LAUNCH with slow start.
+	 * We are not idle if packets are outstanding (e.g. RTO retransmit),
+	 * see tcp_slow_start_after_idle_check().
+	 */
+	if (!tp->packets_out &&
+	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
 	    delta >= inet_csk(sk)->icsk_rto) {
 		tp->snd_ssthresh = tcp_snd_cwnd(tp);
 		tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
-- 
2.54.0 (Apple Git-157)


