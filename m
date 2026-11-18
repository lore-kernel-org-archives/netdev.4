Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991781;
	b=TVzESGEYBm4CykIU7kV/SPoshcix3OIPQBfdiynf4R7FfWgZlALI9kMYCsWo1TO0xpgM
	 0qlHObPuiL6gKv9hLji63LTLnSnN4jJWsBGS32CE4AES7q/+Bo8Aw4bUJYMn3Tj59qDkb
	 vhAN4bIO+gx7SxnDBJ5o2vRMSZoyT8t3KPpuc4aqZKG/AKZr4qH+ZwmEbYGSSXlCioIO0
	 z4YhZCn3AarNqlNONyzNSOJDfpEs17QyyUtAR0dribIawY0HJE9NV3fkZtP7LEAHLEZZB
	 gSySFWoOAyNCriX8X4Z50sjleFK2x1s/UCekT4c/bkydx1PvLjayaB+BLjYpsHIJvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
	b=g/MDUvdVZfkaWhvBsU9ePk5VAeORocT1vVuobtoiA3fk7qI5sXMQi/al8U0nIS21TDvq
	 2WezKxb7X8K70fKkuuYKF5NxOVA0JxaT4gd/Ef2Wm4bUFr74R2p5QDwx5jyOfOQS9pvky
	 iSzkFw4zvNF9Epii4wQdbXwyHdhd893uK8xRLGHk8K7HVy9ujqgu0kUmDbtVnaktbDPKM
	 huRtwyxQiedygHSnSvWDLPPLGzGqabDMie9tsI2Ue7jCCMtTicQQ+68DDrchYzLJif5ng
	 +eUa3tJA5aataVEvRh+29kU0qrPH3tLsr1E6hhS0AhwJrUC2E84o1HnZsUKkYhxZnWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7oNAPC;
	arc=none smtp.remote-ip=74.125.231.129
Received: from mail-oo2-f1.google.com (mail-oo2-f1.google.com [74.125.231.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE53606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE53606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7oNAPC
Received: by mail-oo2-f1.google.com with SMTP id 46e09a7af769-862af378b8aso148285a34.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991780; x=1795596580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
        b=Gf7oNAPCCRd1rqT09B1dAuM9Xla1krFFlz71lRsX5gHLceMZr9JWlhfxsSWEdIqvgu
         jWnLgVzQcjc79iyvGw2qLFrIkpOlzzBzpqPHUg8LPZzI3cCDMjbrijlo2UzPryjWkMSd
         utah1JJTmCiBlKbxSHGh67phkY9R+P/83bYqE26gvungBXtQ4gYul+WMZIbnGSJnmMzx
         hVHzsIMHGha3yRdHvRsFxV4dUpQdpTEsXdV5v+fD6k9XV+IuwpK5NtqTGrysvzPu1MnR
         yJULP2q2OXOC6D/Brdldgz4FAnRAv+kMP+ek4DuVITqfgc+r/O3hko0b3oNgJEZetGJi
         hJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991780; x=1795596580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
        b=wx8cG7gcSE9ugHpkTBiYvf8TNh3jfTWxZmSOp3j4svzYUiHGbyzL4HnsDZzHOdh2R7
         5k4uTNQqE9G6ssgOH61pm6uLpSUlx2DlywqoP9MZbl35pSOWI+twHOLtshg/wWq7D3kC
         RIs/oeR9WPun2gVEcgaTZYTms+LLCXBDIUi1jVBN2L9TkYWTD309r92NboHAWFuxG2jS
         mURMTyULftKYclF6LcX8yp4/JeQF7v2vOwYbdRKpv6970rByiOsWcKzcMt+5f//qtiy5
         CPdmOKIhQvvhS3F1iFLbGXspUIuch+WMGZeP910gMJoFlM487zmhsV8Lr/tZOgjNcurD
         Bdzg==
X-Gm-Message-State: APuU4Z+em3UggLZQXYZzQGDA2DTYc/xufqshXYdFyPyHAAwlni3Mr1Dd
	rJjLBleNUYFVq11q1tOCN3l9OqTy4H2tpYCmX4rCLH6fgi03M8oe65CR
X-Gm-Gg: AYBFou29E27VGQDPxAgxa7tFIjOzxIKhSwnGnTnx8EgBlRy9JmXGCvbNkFTX2gdjjSo
	rvO4stlQfdGUMOi/ZXH1RHA08mHol4mpdOWsbvCIXbsXjLvzciovwi/rpZPDaXHQCLWMPKevqL1
	j+OfrbvcJ9cgQZQNbz0hXDvMOks1cSfrrW+erdHh2AgkmNtMBCfFMmHgC4MNNbPvt2yqSX0iZQo
	ScEPna0PjdN4/QWWst9YUUg7jDZGOlkLLdhBfuHAxpJBIMqf0/vWnacsAQsDttZ2vs8uiLhGr6j
	ljY76cCafV0jzxeVoHSfhYPdde+9o0orWPmWJl9fK+LyETkUdD/4IK1a/Y1n8FNuZeUyu8rfo3u
	PFeGyiQu9zZGGUGD60saGRCY06cksbMxWMT5W+GBY2OKckCpWzOTbs0ZJwcEHMePFKZ/BYEjSfy
	xJXfZ/cUBkhR72OQ/NOGCUkKfR0zAgRJa+xrBUmdK5pnIRGHbaRcZ+3FL+XQDMKLg7DudPmNItJ
	aRyhwOKwBePFw9yx1GWsjyt/zUOSkKnq/1pFbFC+TKsX83BMp9mmjbY7BKjkccO7dhJ35R1W6qy
	2rfQJFjRTJORWybNuwX2mG8S45tA4SVQcWhCzLCauID59TADoUozwcM1Z+v++WjWkpxj
X-Received: by 2002:a05:6830:264c:b0:862:a7f2:6d7d with SMTP id 46e09a7af769-862f086c34dmr1737910a34.24.1794991779830;
        Wed, 18 Nov 2026 00:49:39 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm1530710a34.3.2026.11.18.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:49:38 -0800 (PST)
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
Subject: [PATCH] net: initialize sk_peer_lock in cloned sockets
Date: Wed, 18 Nov 2026 16:49:27 +0800
Message-ID: <20261118084927.1756747-1-bsdhenrymartin@gmail.com>
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
---
 net/core/sock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878dc5b..b5e2a2a7741c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2545,6 +2545,10 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 
 	sk_node_init(&newsk->sk_node);
 	sock_lock_init(newsk);
+	/* sock_copy() copies the parent's sk_peer_lock verbatim, including a
+	 * held state, so the clone must start with a fresh lock.
+	 */
+	spin_lock_init(&newsk->sk_peer_lock);
 
 	if (lock)
 		bh_lock_sock(newsk);
-- 
2.43.7

