Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486891;
	b=Ob/HW1xH+GtIDiZfWf1lkSesAxYcloTyZsw1a659U+m7RWm379X1wB9EUpjmFHR+iIxJ
	 Wc3YxoezEqvzh1+MyPjzGr5oV53/pRtpgjSIfdoKTjBmK9EdUSIgSQfqqpoIt23r6I05B
	 4VXKuoI+KaaP1F7E3r/7XtuiC6Z7zyTWaPiekb4JlWjFhMjJmYNlUQVyiLbqEAw4Mxf5f
	 BxkwDS0cU34OHaYG39uDVLOOMWARoPwn7CsZ+NAJ/oTEaA9RiU0POQ5waAX6LI+QSpEG9
	 KmXVaK4QKvKEEsxsgXYiIr3mAZJamjzNtUz9wcNEB+ZZkvU2GsvRoy662clvmcifqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
	b=TsLJz0mw89Rvtcc8D+rqo0lkzknjCkaJ/LM5qcIsBHpqud7l8qhiHvlqxQTJCQtYIpC5
	 NIlv5m74edIXoTLzrSEy0gPaWjIfd4rYmKPgWG57KBDGI8pD4jeNj4m+G0TSjRl7hkbh2
	 jxTvZMjda0UmcAQpUwldUmUXEhhhOI4cqT/noP5XYxtCb8Cni6wGqU7ZOXepnLqKK5h9h
	 zSbaV0dJ4DAwgTLCLySjmYmTYfR1reYD7Hy+QSwJw11cF+osTNZs//iPQEq3Puoqi7XlF
	 DusuWB0wZJEYTRDhIhYwo9qZ0A8GKbB9Nb0zjjcrcjtj5vC18W5O5wvEr0yf9BBNTIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZz9fFo;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865C606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D865C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZz9fFo
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f041f88577so21673925ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486890; x=1796091690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
        b=LpZz9fFoyKJtDc3WnHBrsmEvV1Pgqp5tX4/73EvjvaCXtckQ86HWu1lM4yKPOLSPyQ
         3Bs+OqDHcG4rghN6o+2neRpZD63e8a4GSmp/mNk8x/JJIGmuD3ddPikpZO7cLq1TUrFU
         +19rYkQxY0aG4B1JpwKD0QJ0cTOFBiuNDNManLol9/QJUqLnBpAb2+X9/kf7gS7SXDEe
         eiCE4aQTWJtXTPrus5OhWQieSbp8YtiYVYem01xsReDaLYaSwpcGEI3ZEJzyb0LFWfFd
         WU3jD7OMVfDokDSjW1E/dw9/lqsoeD4kQpyx1oSxxjYc2ora9ejnMWAHzCSNVjrKnerp
         brlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486890; x=1796091690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
        b=i6aBuazgyWWvhbppB8hlyulwh/ID7Tzl8xpjGtY+LXFB4l3kkf2qSvudI1o/NxO6nR
         lcpZ21e3/zfxF3T4nHBQcjx5rkfxiseruTITklNw8Djng1ctGFCJzyllNRuO8OoC58+s
         /BAli9DhblEiDhOf+hIBentqwrMPaicOvgHTrFjxNhzeisEj+qQJyxmQ5BeqKjtx5yYO
         FVFoL6jb04+cXaOYQR8LwvL2cHsLNW7co0UoI8HhS7FRyXS+c/DH4LzIQBZc5/uVhBax
         opUiohfVgPlICBvUm+AOzvQM2Frpl1EdgeANRp++eKm/ZzZEJZ4qTcKZuqMCsvTCOiOU
         Bvmw==
X-Forwarded-Encrypted: i=1; AL+hErFUNQGWOXwJ6K9P+pIw8REy/oyuI3Cmlb476ex643ucKv61hPLNu7CRK+fh5nLDDAFoGp7hZIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9urj7eQFZE57S78V+Trf81j7NFDADqPLmShn6AYRcr1oOqVqGB
	KbGr/Mw0xq31LvSN8Pr38N3yl0W1ES7SZfN7McdrJwqdi+AwVMATcFQu
X-Gm-Gg: AZFdTZd65y4Rb3zahHwpjASocd1Eh1xvQ5AYpuXRVTC9ItLTUCKexQ+uvVjHEgb+F3z
	mjoGp6rgwcHHsqRJTG0MOoZ02ltXrXqndehQJv09cYu5r9tTSYOffy9PFv0Vqm7639fHy9m7Y31
	iKutzEvo9byxKCBSdtiBsP0a2x6aPSg2qxIsh6xaXqyVq21Q48Qu4y0PiR894GEShYjP/1O18ms
	ZSJtvdgiSH8Ek2ld+yJ9q/20fFFG1nNjjV8pkF7+IODSG0v+1RBpjoVNOyJv33oBRKugiGzoVmr
	s2yl3QsyD90Xkv8RW1cdw9g1MKRZww6BUdH3ZnCjccHe50qIUDeZ+cwDr+Os5VGZ7EBHfsFLYnl
	1kriRiX+cZz4PadbA1rz9uTs7EnNc0rSTyl0ygNW2okcXUjIPyTd8qHimgIlRT2etv2xX1D6ZyG
	mPN8mdkCfA3ZFEmzEH4Nc/S9qD14yNPzNCFtt5F4zyU9xIEj43xoNQ9uy5vN5r9g4bK0I4NbWBj
	L2KvYxG8I1DMkJI4hhG9lSTHEXdZCo0/2Iid9o3S0ZRZTt2Z07KOdsndsjrbDnH59fqH+QW8NR2
	8I0WjbnmpwNx2iQ7dpYKMGD19pnd9/T2gsy9iZeSTXPNVo7bUsOx8U100pBJ1sKVCIUETsZ+Xw=
	=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr128824035ad.54.1795486889807;
        Mon, 23 Nov 2026 18:21:29 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b7be3347sm7003095ad.15.2026.11.23.18.21.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 18:21:29 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: marcelo.leitner@gmail.com,
	lucien.xin@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vladislav.yasevich@hp.com,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	stable@vger.kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net v2] sctp: preserve the peer transport during INIT error cleanup
Date: Tue, 24 Nov 2026 10:21:00 +0800
Message-ID: <20261124022107.32283-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

sctp_process_init() removes non-ACTIVE peer transports when INIT processing
fails. The transport matching peer_addr may itself be UNCONFIRMED, because
sctp_assoc_add_peer() only promotes an existing UNKNOWN transport to
ACTIVE.

If no ACTIVE transport remains, the cleanup can remove the last transport.
sctp_assoc_rm_peer() then interprets the empty list head as a transport and
passes the invalid replacement to sctp_assoc_set_primary(). KASAN reports a
null-ptr-deref in sctp_ulpevent_notify_peer_addr_change() through
sctp_assoc_rm_peer() and sctp_process_init().

Keep the transport matching peer_addr while removing the other non-ACTIVE
transports. This preserves a valid replacement path without retaining an
arbitrary UNCONFIRMED address from failed INIT processing. On a live
COOKIE_WAIT association, T1-init remains armed and can continue using the
retained transport until association teardown. Successful INIT processing
is unchanged.

Fixes: add52379dde2 ("sctp: Fix oops when INIT-ACK indicates that peer doesn't support AUTH")
Cc: stable@vger.kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/netdev/20261112092114.12458-1-ljp1205831794@gmail.com/
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
v2:
- Keep the transport matching peer_addr instead of an arbitrary last
  transport, as suggested by Xin Long.
- Update the subject, cleanup comment, and commit message to describe the
  retained transport's use by a live COOKIE_WAIT association.

 net/sctp/sm_make_chunk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 15c2d87575a8..65594eaaeacd 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -2525,10 +2525,14 @@ int sctp_process_init(struct sctp_association *asoc, struct sctp_chunk *chunk,
 	return 1;
 
 clean_up:
-	/* Release the transport structures. */
+	/*
+	 * Release non-ACTIVE transports except the one for peer_addr.
+	 * Keep it so sctp_assoc_rm_peer() always has a replacement path.
+	 */
 	list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
 		transport = list_entry(pos, struct sctp_transport, transports);
-		if (transport->state != SCTP_ACTIVE)
+		if (transport->state != SCTP_ACTIVE &&
+		    !sctp_cmp_addr_exact(&transport->ipaddr, peer_addr))
 			sctp_assoc_rm_peer(asoc, transport);
 	}
 

base-commit: 145480b28ca82e9fae789427cc4569e596515a32
-- 
2.55.0

