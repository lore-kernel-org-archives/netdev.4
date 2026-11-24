Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543563;
	b=yh8+CWil9L56y9gT0VMVCEdyCVVwzejoVWhFWXdx9+31mFZnIjffwX1PSFQ3AWg/DQI/
	 EeHoORcs70QR8YLXVjMhjh6iskHIdIG4gQg245kzWKDjviD2b3pNvtBh4phrmeF8qG0Ly
	 0qBsQ0sq5ldINLzQ31LqDdln9qqU1fWcctsbiCE7XN983V4kskKRv1ITVPh4xR2ZY55Vx
	 EDAzYvG6m5eHZQl90AxNx7Bd3DkqufEHG0POPvSiZZ92li/HgszC+3X3irt6E752GfFW0
	 R8wI1zSh8LFslpfuILakzv9k4y8cMUeaF4nYRL93VObaCKqBpxpHJt11fmnIINpU2NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=WG+Ywdy0mWrcMOmjmi8tUvp/FcgS4Hr76EqI/0PZMEo=;
	b=q5fcu6HGkCH/wZ+Vfmac1tiDHTtIDrYzscMFEsLXpwiWDlq3WDZv+SqUpSD6/RatRQF8
	 hZ+71VScjzExLITAK6mV+ZCOesGSgC7auSIk9UN+kBPHs870pY3DIEij9tfxg6MkvS5YY
	 HVI88k8CInxnxmryGmPUCiKT7e8V34n36AtmGeSK8KjePchQ+F155iE8PCSTOdEo0mEEc
	 FOjEcnQM6RcOA9HISU6HmFnni/uU2wrLZ1fIIBlWdRPX5lquOwWKFzlAM3sPe86Sy6E6D
	 dii3NtUhviDoM5B/q+xdP91SkFkPmvTLtJu1WZW0qLtBRj8FHrrpwZRytPhi1LHcZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dYv+W4dX;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872A606A689
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E872A606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dYv+W4dX
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so34125615e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795543561; x=1796148361; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WG+Ywdy0mWrcMOmjmi8tUvp/FcgS4Hr76EqI/0PZMEo=;
        b=dYv+W4dXyN9+iHgkzsIf1aN3DvMeJiFQjiwcEgqRXSHttAqlDwb/3OIK+IYR7UaWQc
         PdsWOJhqfwEnUfRb08EnTmxzWhWvWkByObh3WYKBTt7GDTAYQ7otfq3rr0C765J/wwFG
         eWkPByo8GliiJs0lDP/+i2lygXcExMa116O3aE7IxEwt9nTs6DURSot/T/mWJyUqK1jf
         oDrmKXu/ox6pG1Czzz0qDbckb03o7Uxlq0bdLlz0/1Hy84TB3yu/QSTwbNxN+XaZyJiI
         bmy1aJsbCvTGm/0vkbZNdX6W9SXIlHgLe4UUlzU2LgTAe+HYEXWvODAKAwcy/QlHFJqY
         QZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543561; x=1796148361;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG+Ywdy0mWrcMOmjmi8tUvp/FcgS4Hr76EqI/0PZMEo=;
        b=u/u5qL9aYMsmuP56bTs0Jh06LQHeGXX0gEErIlaxe8y7IP4J+ffOW0sM0mHOCeIp35
         P+Ikvp0BQMwfKqFJCSLd/D38x0n+Voie3RHa97OxW11aiMMTZD0fnizmRm4pS5qy/JRU
         wQ/sCl8Ez+V5zDhYbylTnRYedv6npruC0BlzDHtoGd52R7c5K8vQTr9sTv88nMMgwzpZ
         beiCbhag4ssZlZcOcsbI7gNkEBUVGdxb9hm1tUqcWDwTMmXzbufgfloFF5yMldWfNSLh
         1aohvCvVaEsfbZJEfHkV7VQbrDhFj7HERgDo6lbnEczFNzUM53YWhpgKDkidpfrwCH1d
         gEjA==
X-Forwarded-Encrypted: i=1; AL+hErE3k4OinpmF4X92ZC09u1vS+YsRzWQjiULMGSTvnF3QRlA/1vc16nRXrSeqULIEYO8PzGkNyo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i6UiEPVjvROhwy89aEAOZZAPkCttPaYUvJrHRQuODMaHCfpoo
	eo0MqbsdIxAc+uYJSCoAQPQz66MltKjsU8amN9RotJgZIAL/yyj5+O5d9nvOjdtGpM1WLdYlsg=
	=
X-Received: from wmfo3.prod.google.com ([2002:a05:600c:2e03:b0:4a2:8ef:a5af])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c1a:b0:4bb:7292:b871
 with SMTP id 5b1f17b1804b1-4bb888108ffmr339503705e9.14.1795543561212; Tue, 24
 Nov 2026 10:06:01 -0800 (PST)
Date: Tue, 24 Nov 2026 18:06:00 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.663.g77904e546d
Message-ID: <20261124180600.71138-1-dmnk@google.com>
Subject: [PATCH net v2] inet: release newly acquired port on
 inet_csk_listen_start() hash error
From: Dominik Maier <dmnk@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com
Content-Type: text/plain; charset="UTF-8"

When inet_csk_listen_start() is called on a socket that has not been
explicitly bound, sk->sk_prot->get_port() allocates an ephemeral port
and links the socket into bhash and bhash2 without setting
SOCK_BINDPORT_LOCK. If sk->sk_prot->hash() then fails (for example, when
a prior failed connect() left icsk->unhashed_state set to TCP_SYN_SENT
so inet_hash() returns -EINVAL), inet_csk_listen_start() resets sk_state
to TCP_CLOSE and returns the error without releasing the newly acquired
port.

Because inet->inet_num remains non-zero while SOCK_BINDPORT_LOCK is
unset, a subsequent Fast Open connect on a dual-stack AF_INET6 socket
can update sk_v6_rcv_saddr via tcp_v4_connect() without rehashing the
bhash2 entry. Disconnecting with AF_UNSPEC then invokes
__inet_put_port(), which locks the new address's bhash2 bucket while
unlinking and freeing tb2 from the original bhash2 bucket without
holding its spinlock.

Record whether icsk->icsk_bind_hash was already populated before
get_port(). If sk->sk_prot->hash() fails on a newly bound socket, call
inet_put_port(sk) and clear inet->inet_sport before transitioning back
to TCP_CLOSE. Explicitly bound sockets retain their port.

Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
v2:
- Move port release inside the !err block after ->hash() fails and call
  inet_put_port() before clearing inet_sport (Kuniyuki Iwashima).
- Drop the extra Fixes: 8cc3aef0cb19 tag and move the testing note below
  --- (Kuniyuki Iwashima).
- v1: https://lore.kernel.org/netdev/20261119192133.2632936-1-dmnk@google.com/

Found with AI-assisted code review; reproduced and tested in QEMU on
top of net/main.
 net/ipv4/inet_connection_sock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 9a3b05edb62b..b8df2a05572b 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1369,6 +1369,7 @@ int inet_csk_listen_start(struct sock *sk)
 {
 	struct inet_connection_sock *icsk = inet_csk(sk);
 	struct inet_sock *inet = inet_sk(sk);
+	bool bound;
 	int err;
 
 	err = inet_ulp_can_listen(sk);
@@ -1385,6 +1386,7 @@ int inet_csk_listen_start(struct sock *sk)
 	 * It is OK, because this socket enters to hash table only
 	 * after validation is complete.
 	 */
+	bound = !!icsk->icsk_bind_hash;
 	inet_sk_state_store(sk, TCP_LISTEN);
 	err = sk->sk_prot->get_port(sk, inet->inet_num);
 	if (!err) {
@@ -1395,6 +1397,11 @@ int inet_csk_listen_start(struct sock *sk)
 
 		if (likely(!err))
 			return 0;
+
+		if (!bound) {
+			inet_put_port(sk);
+			inet->inet_sport = 0;
+		}
 	}
 
 	inet_sk_set_state(sk, TCP_CLOSE);
-- 
2.56.1.831.g720f3f5937-goog

