Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116097;
	b=A993LBDwZ5gsb7nofJuaTUWTCcUUrzq64n5wm34fHu6SbZBmJDb00kuD3Dnv89kGDAwf
	 5HprmSXdTwjJMNzU6XP3A5CUKkdtEn6P1Hn92yQjg0Zkd7OeWv8lgrpOyQS6gNDD7R3kO
	 JONntbLOCDaPnm47DrZYuks6uC43E0NWTgxPSvGK+pH7ykXmdzrDIL6N031NsK5aYh/Z9
	 8hDT0V42/P1SX5d7tBxxRcFmBdFm6FdaZeENdB3HzOIxyAz070ou4gRuAVyKy1yH5ZN1C
	 8MXD2XNda7R3EILUxKdZmfWjEBVTayQ5t9ru9MSza4EUjbG5dLa5ncHjN3OZRhfdUug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hvGmjhZumsplUlRV1mVc407Hh1F1Pcfr5kjOwvJ4haw=;
	b=kivj2GnA/KtNRjTp1uqqMxlzjWG+Iz7yM4SuMq34ux282cZSscLD5jBe2nc6luS/Oo5c
	 u603T/eWRCHCsY5Mm8oiMYX5qwzwNMf/zVuSGnJwdZ/Fyv+wWTC2fvXbW/YgQ8FZGCM9+
	 VVgI9XUYtOBqYvcEt30ePXtAVbBv5QiRbNaBU5ooTLBQelX/0EEed7OgKz8tQiLHbjDhj
	 G4kD5Gm5fWKH4ICZXu4zR+jVOp7JAGTbARtQCBGLthYRfjCbp2QCSMjlGKmN7NbCh4cA6
	 OKZvcgwT9Gj1daqgZyKYts+BGIIKKoK3gS/aNqBScr/gQO33zmyHU0gyLaePV8bhupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mF5yW4Nl;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8EC606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8EC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mF5yW4Nl
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c505f26e9e1so5123066b.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116095; x=1795720895; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvGmjhZumsplUlRV1mVc407Hh1F1Pcfr5kjOwvJ4haw=;
        b=mF5yW4NlkljkOfEqXmg4/K8Sy2U46nc2FbSR8QYEQseQTRDpLKX+GxZm/MArasojZf
         69oquiWi9l9OwTEmf+qVyu3wj/z3BkQfprAsZoCKKjCFCcnoXdZWvbkWHYazOrg1lGLr
         zd0Sf8s2ALs4Q7Cw7LFjFm1K3NS8mNVXv5UPSUd0thTnmVwdf/IXpFdFTVWIZx3Rh4tt
         skXdFrj8Mmo/lg6Jytobyc3cVsVw2KTW+0493oAMptNsH5Y+SI/J/6hDsf+VpyJmFTbN
         V2HnapkhdECVHNxswju4+bfyl3D4E9H0oobWCt38JSfWeBQTs69i6URVp7oGoQ8lbBet
         bL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116095; x=1795720895;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvGmjhZumsplUlRV1mVc407Hh1F1Pcfr5kjOwvJ4haw=;
        b=j7CSORqefujGkLYOpWFJeFhhK7ru9dox5t4G73+Qojgqobfh/DrNDebx1eHRtCxH9e
         InXhivOqnpVidS2aSPt265quMB0+Ud38Pw8W4hMBOxeUQtHHSIplldSbFf7Xb0ZZsBae
         ycu8eIUJjRztNuQ64vU2QDmmYoX11eoA3cDMXEX/HXIC5oNSVb52W+9Txz6z3LvXF6dY
         psRQfWgnO2uU8fL2y3NRZWQNkP8lATpDnWyjW/JtOAv3tKCaTC84tec6diX1q5eEUD+h
         MtQ6UTmT/y9tDS8Wl7bgo1rI/++tm1coAZWGXMFOogb9I2QD6+GpHUkdukK03kY9NT96
         yF+A==
X-Forwarded-Encrypted: i=1; AL+hErEu1MZEN5Z3bU9RfZXC3vHsx6fs9wrwGeW3JyC5goam6h+WMQesPosvC1RsyGFoGAz87CnN3M4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WScbayliyETYW+snwTqJ14JE7qm3Kd8f0ZcmNhTJbS15gKqyl
	CllZh/7MpGIGBc/V8sfQQM2JcNd3Np4ErILUyBurxdL1+7pJtHsxZYmpav2B1P8soGYMTbIwqg=
	=
X-Received: from edoy14.prod.google.com ([2002:aa7:c24e:0:b0:6b9:c441:632c])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d0b:b0:c41:1781:a2af
 with SMTP id a640c23a62f3a-c51317e3353mr255291666b.9.1795116094685; Thu, 19
 Nov 2026 11:21:34 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:33 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192133.2632936-1-dmnk@google.com>
Subject: [PATCH net] inet: release newly acquired port on inet_csk_listen_start()
 hash error
From: Dominik Maier <dmnk@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com, Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

When inet_csk_listen_start() is called on a socket that has not been
explicitly bound, sk->sk_prot->get_port() allocates an ephemeral port
and links the socket into bhash and bhash2 without setting
SOCK_BINDPORT_LOCK. If sk->sk_prot->hash() then fails (for example,
when a prior failed connect() left icsk->unhashed_state set to
TCP_SYN_SENT so inet_hash() returns -EINVAL), inet_csk_listen_start()
resets sk_state to TCP_CLOSE and returns the error without releasing
the newly acquired port.

Because inet->inet_num remains non-zero while SOCK_BINDPORT_LOCK is
unset, a subsequent Fast Open connect on a dual-stack AF_INET6 socket
can update sk_v6_rcv_saddr via tcp_v4_connect() without rehashing the
bhash2 entry. Disconnecting with AF_UNSPEC then invokes
__inet_put_port(), which locks the new address's bhash2 bucket while
unlinking and freeing tb2 from the original bhash2 bucket without
holding its spinlock.

Record whether icsk->icsk_bind_hash was already populated before
get_port(). On error, after transitioning back to TCP_CLOSE and before
purging the Fast Open RST queue, clear inet->inet_sport and call
inet_put_port(sk) if get_port() newly bound the socket. Sockets that
were explicitly bound before listen() retain their user-bound port.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available upon maintainers' request. An earlier revision of this fix was
verified against the reproducer in QEMU/KVM; this version, rebased onto
commit 342e62fd34c2 ("tcp: purge Fast Open RST queue when listen() fails"),
was checked with checkpatch.pl --strict.

Fixes: 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash and lhash2.")
Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 net/ipv4/inet_connection_sock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 9a3b05e..2f367a1 100644
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
@@ -1398,6 +1400,10 @@ int inet_csk_listen_start(struct sock *sk)
 	}
 
 	inet_sk_set_state(sk, TCP_CLOSE);
+	if (!bound && icsk->icsk_bind_hash) {
+		inet->inet_sport = 0;
+		inet_put_port(sk);
+	}
 
 	/* A Fast Open child accepted before a previous shutdown() of this
 	 * listener might have queued its request in rskq_rst_head while
-- 
2.56.1.809.ga0b61035b5-goog

