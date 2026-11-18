Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997083;
	b=WXFnKa5DEUR5Frhj9Xaau5v8DYA/zi2eUm1/0ttR7erAe2rTu4mU6Lx7s8bCj4t9JWQD
	 ZX9ecxVjwMi7huIWEtaDab7A/Q/nfLoZgkntbjUt6t/1Lx/VTl9+RCynQcgNGAwF9eDy+
	 7OZyfkeakHgGapVTTzcXOOLwdqypq+fDbui5A5tM1basRpfe38xNerXuw90HqyvJpLSeH
	 aso/hgb9VOTPNxyWlzE4qEVftrkKhT4VMr5SS6SYH2ES7nwrUzxRkV8EDHTbcn20Ns7Yz
	 3FvhEHb+vl/9Oozrtwt1KlnaqGIGe/ekEREmflAnbTuvRZKAsaaMm02lfTE3KwEHP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
	b=cuXLTTKmHKE/NZXGOiYjtAZEaSvgu4iCd8Q5OPtVsk6MjF/Vxu6Ytw0HK3VjoFzr+SEb
	 zvcmm7v1EVa42Vp2DK4rLtHDtJkqmot+k4th2CRUhukQuYoFhKq72ja2alGKhLxI/G3yT
	 4BGYytCzMasNKhe+ubSGWnDoGacY0a6r/LLYrkEbjpMuWF1JVQCrcVTHBELng3BddhzdH
	 EO0ATB0JgfT4Y9Ir5TTmNwTVny4DOcBGwHvMwPuOjG8SblHTomQ9OXX/hshYOaDQu5K00
	 LsGPka3Se3Ga+hDRz4u23PdjqZarzl2wT6+U7bXrnL1xMg0Ocy/EjC8jbuYt/CLxkzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNHHFZO2;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18047606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18047606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNHHFZO2
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6ddeba3e85dso161535eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997082; x=1795601882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
        b=uNHHFZO2ZWTl6wjsCFAG/t3isVNM5BUArcyiCTu8msNqQOHHSJHOQeDcsjBiDZryVl
         Qa+xjH6lLze0MKSlm48eQtg/RIuygvNvD611LMDbqxqF3T2iKHL1neKXRI2f6MwQl0Wf
         Nf3jcxNOmbWeMJlnhS+c4rT14GEjZMHBWNb65i5PBUn4Mej7/RhGZ/KRp0Rc6+eqRiV4
         oNioML4frdYcY2ILpjSZmIIHPjooXe66RirHa1Gi03EKfEdtD9sUpHxDCd9fdJdFl0bK
         aq4glU9iuVkSG5Acx73BnMjhGZ3gVTz0S6kjvaRrsV8cec1ibV/I5IKjSbwKfM3HT7Zh
         rM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997082; x=1795601882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMFZcDH6aQIFtxqkM360mGsHK/mRi1dMwYrjxUKwiNQ=;
        b=We6/9U44A4ETJypDj1qZfGsOFZ8QbvWgkGFmvdeVPLt70nLV3YAi4xWvNFO3u2PgZc
         HzIt4B+HmIZkfdftowhLN46GEFK/uOr8Q2pJY7ZJvN9Kpo+/9p7swXiizWYqBeTeVqeW
         Q8rhuqa6Q7PiY8Q9sxJtHinl0CXlSSbntSlHYBBhGHPvKGGISPZtik8rHn57WyU4zuH7
         T2JulgtCKVg345y1foN8HFHRqJP3CDh3N2VHVMHHdV1e8hjoUomI63zP3ns7iAfvuOqX
         /Hsf9C725j5A+1vvreeuq+A+yzfBtH32lE0WqKGAVzbL3Wbcvt8Wwsv8vi0p8LfZ5yNv
         JMcA==
X-Gm-Message-State: APuU4Z8UxNfSJW0iHXKVD0y9C73sUC62J2mq9aqy3ldpXQ3UqcF0c4Q3
	mCmNDtOHEd6jiRrUHLGHm+K36N7hnwa0Tcesf5ysqrqXfZbATWRlIxdc
X-Gm-Gg: AYBFou3qXW7pIkoIgftQ8CMmv1xX5/bNpuSKhAHOXYSwK3nY5ldSK2BGmiKokTzalHV
	x7FVEBPT+TX4K+42T9IQHuCeK41XHmB9MAYvyxGpzbubxzWKhmJjOQ7Oan08EEcTQ9Vm00edpNl
	sTnukAZLPr/4wYe6ztbXMTJAMIRWFf8UIW+1QTrKzaHwgq2W+Ywqgs1+d0aDcQbmfpRjX3Elyu6
	xFCA0BGyzXPMi057MvHxX0JJMthhX910OiwiTarRNH/5aA6W//ZEd8EuUw+epPJqI/e8M1iL2iq
	Ew1ftB3M2v70qh8S+KhcvPg9YE4786Osa76wsgOdzKOWftMtxD920lWipgMopEqInbKafbiHQ82
	eB35pqQxNq+mYTZrbDijbnNfUVMi5w4BOKHR1BcnxnWOpqkCr/05NkBBPdzJLaSXsH0NQIO7C1L
	DcR6Ql/wir1JioT4a8ahExh6ibI+Bmvdt457d7ssB2qgWZlQ+lSxHRFcq8Rdj4NmrcHGVmq5bUH
	6Rz7wYLkS3TITjvkI6nytgO17F+sN5ydbDpztFb46ULGMLzAzet2uU14S1HnwG7X0DueEn9AzHo
	3BBF6v2IOzs0NTv9wD6XXiAdRuc9FJ62IS1YrGeXgLU+PD3Gkh5Yz7L8ahY53qYvPy2/v3Kr9zz
	cHBLIYiw3zvJo
X-Received: by 2002:a05:6820:2306:b0:71a:ea63:ac2c with SMTP id 006d021491bc7-71b18657f8bmr1251461eaf.84.1794997081863;
        Wed, 18 Nov 2026 02:18:01 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm1889777fac.6.2026.11.18.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:18:00 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: initialize sk_peer_lock in cloned sockets
Date: Wed, 18 Nov 2026 18:17:52 +0800
Message-ID: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

sock_copy() clones a struct sock with two memcpys that both include
sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
inherits the lock in the locked state.

The first getsockopt(SO_PEERCRED) on such a child spins forever in
queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
task never schedules and its CPU stops reporting quiescent states; RCU
grace periods then stop and callers of synchronize_rcu(), such as
expand_files() from accept(), hang.

Initialize sk_peer_lock explicitly for the clone.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v1 -> v2:
 - drop the inline comment, the changelog already explains it
 - use [PATCH net] in the subject, as requested

 net/core/sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878dc5b..ebc83a466d91 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2545,6 +2545,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 
 	sk_node_init(&newsk->sk_node);
 	sock_lock_init(newsk);
+	spin_lock_init(&newsk->sk_peer_lock);
 
 	if (lock)
 		bh_lock_sock(newsk);
-- 
2.43.7

