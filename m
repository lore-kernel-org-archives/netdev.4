Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574218;
	b=pxM5XJKmemQlVln0ttaxfWfZEOoh19bre1GR5BRaq1RGTmbhjV6qt0B6b+uuRj55oKao
	 0csrfpRwxTksAKwTzAoF90L3GyCFLcWDDsxoHJZBtvoa/buoMlXuTtSfwTnV7Kiaq4gn+
	 ph9tpeqaaS1OdPxEq0liob9Gc6xbGePcuF9juxytgJ5I9U/X/p/Jt2wOT7CgRRnT8xLe7
	 f0A5rMfv8QssIDDwfdshADgEMAK4C/uLD2mDBb0xu+QLMoUPDpF/wCQSFwQvLg9JkC12h
	 rvm4NqQuwIYnE7spVBEqzL8uztzxvqxjbcwBGOgcZBvuk/k6JKwECTfaUSa+ENIhx/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
	b=kGxCtHrfrmQho3T5qDCnAg4uxuGaSwOJ77u0TSuoqmLVczzAywGsXlzakfF48rNJmy4C
	 GabEu9BR8W/MWKhKUBwdvmAAxc7xcaErz25C8ngWr/f+OsWNnpzIzcg3iUvAidGEYJ7Ko
	 P0qtkxqJHyfiZZOSOB5LCLEAAOWJq0+4BjyKG16yRbLrCZVTUoEMmCGgah6xXoBk7pITx
	 0LwfEOikp9Hw8mdomnTPHQ4AuStC4bSHi2AC8kX2cBRlubbHMt8fu44gKyWwBH+b3LKe1
	 GjVSQGxwydmvgEusdfsrPmhdxfkomWVQYE3zvlzRrD/WW09OfuKhrY+Pi7rSzCx4Qrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6JkcNuZ;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96F606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA96F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6JkcNuZ
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b271e573adso2232797b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574217; x=1796179017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
        b=w6JkcNuZetKNcfvjGYEZkRJSqOX99DtTgjmY/t9hV67fWOF43XdsPIeBTYmmEN7tqo
         Oe4rl6Gskg3nN9WTVaMEDs+7cBe4MJVpRtuNMoxtbhfM5NAriK7aRrMxnlZ/g3vOB28C
         FLqHPHweaSbTAWnKlIs3HXSRSEwQkUpswJ/BR0/SkW8cgxumMCpw7qcVlpPQYAXRldso
         8qywPQ4QDcRL5YHtCn43ETUlfTBX/JRE4sN72uFkWO+gFJ9SAfauQKhPkpDwDZsAcKV9
         SHQp/N5GieLUvJfNMx2lrBqv6vw4aQ7rTo2wgxdRNRzJPzfL4WEB8cDmLQ86+WHbmTQm
         gnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574217; x=1796179017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
        b=HM3XOg6jvMM063nnxFcSnw500lgHkKOb8NfyIMfqdNwMtrwMwEMVla4Hc2j63iND0X
         yQYMv7+gN963IRxQk3Hx9qNDUkKEOoMlEp8Mr8UomCeDGC6Unh4rod4XT1TXQftMad6Z
         KZJ82jz68PwQCq1KK/Jqh9rs5L8M7fUfMNbuJhg7p7OyTpr0HYypq/+hXUit2oG81zpt
         FhtEeNOK9S3FcidbpUwi9kZhZCMcqQnlNzXJ9cVWj8C6gZCTxfEoD+Xz4HbIV14rEcV8
         qoI/kULG5U44PHrsfV9RcXixcNyWXLUd5989dDY7rUHHorsv7KY/vWbO8TWSPBggZ4Ek
         MJxw==
X-Forwarded-Encrypted: i=1; AL+hErFEeOMqGKHHuJUX1w6aal5YLyLJjkyTamqx8vQTFxlZrxrVwAApSikqndE11l3oE8+2lFkeKzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GicBLdtOBeRxOMCfvuDndYRN/Go2gU1IszCb1PpmBanuBDz8I
	bzXERePH+1Tv7lX2C0OjhA5GhYlYUF5TXdXr9R/8Fp658tHktsO3NVVG
X-Gm-Gg: AZFdTZfKQXZuScQegXgrBsuSP1Q8YLwx2DBdx7rwJiUYKxQbchqRRr8W6EuLMW9RZDZ
	Jv9/yNAOm/P3hVpwMJWgdyd9a8ZAIhq0E1rKc4bLJaG1PoJsF4CjvjpBOoRJuKx/iNCXGxJ+Jg7
	wJvpudtth2BqvD9C/bYz7fBqYo+bhGi5rDi0mWnFujyXsyssmFxPXlvRi1Ej1G2iVUcln/OsA9d
	H4FH1xZopZJVPqckkPG0a6M9jagEs3QFFz20ITEXwV+RokbYJ3yQqa7Sx/VVdY5jfjLL6jJV2RP
	ixDLIqL5/938Ky4mv0NuQ+ILF8EMlDudAcYXVBkeperwrinUFVooSiMehvUQ90stog2SxMTw0/H
	4jbPdztbRzQAfWcl8ab/OBc8cGNiGuo86sXjQe9tEVo0cEZaCIjtlTaCIFuQIZfymHNPV+rKYtz
	AqzZTYTZ8LTsx5q2coEheLGaNkA+mFXh5MQxIO5eN40WNBmo5HuRvwUE6D4ukbYhcoJ9VePPOIH
	+/I0UM2Bp1Gnp9UuYrjpePNZmXfeBwS1oQP0hNTg0Ro0xlQ8yM23xTwD1X1c5og/bFNMDAN4/wo
	+NOU5Bo9tqOOTrKCDKHLNNyAVfAGGGwKfJsKOvvMiNLahbKspdjdFqFG49tpXtZFcGE=
X-Received: by 2002:a05:6a00:1820:b0:8b1:1b86:71d2 with SMTP id d2e1a72fcca58-8c87bfa766cmr14875130b3a.22.1795574217152;
        Tue, 24 Nov 2026 18:36:57 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm7294885b3a.23.2026.11.24.18.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:36:56 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Wed, 25 Nov 2026 11:36:50 +0900
Message-ID: <5d2a09ae8d660d10091942d426c0c8f1f82c1705.1795572890.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795572890.git.kyuwoncho18@gmail.com>
References: <cover.1795572890.git.kyuwoncho18@gmail.com>
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

sctp_sf_do_5_1C_ack() queues SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
If either fails, sctp_cmd_interpreter() stops there, but the association
stays: with the peer marked AUTH capable and asoc->shkey still NULL, a
chunk that the peer wants authenticated, such as the ABORT built by
close() with SO_LINGER {1, 0}, takes a reference on the NULL key:

  BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (net/sctp/auth.c:113)
  Write of size 4 at addr 0000000000000018
  Call Trace:
   sctp_auth_shkey_hold (net/sctp/auth.c:113)
   sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
   sctp_make_abort_user (net/sctp/sm_make_chunk.c:1016)
   sctp_close (net/sctp/socket.c:1564)

Process the INIT-ACK and set up the association key directly in
sctp_sf_do_5_1C_ack(), and abort the association with
sctp_stop_t1_and_abort() if either step fails, as is done when the
INIT-ACK fails verification. This also aborts when sctp_process_init()
rejects a peer that is ASCONF capable but not AUTH capable, which used
to drop the INIT-ACK and leave T1-init to expire. SCTP_CMD_PEER_INIT
and SCTP_CMD_ASSOC_SHKEY have no other users, so remove them.

Fixes: 1b1e0bc99474 ("sctp: add refcnt support for sh_key")
Suggested-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/sctp/sm_statefuns.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index fd9f94c12d42..206fa0b6cd4b 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -605,9 +605,11 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct net *net,
 
 	if (!sctp_process_init((struct sctp_association *)asoc, chunk,
 			       sctp_source(chunk), initchunk, GFP_ATOMIC)) {
-		sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
-				SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
-		return SCTP_DISPOSITION_CONSUME;
+		if (err_chunk)
+			sctp_chunk_free(err_chunk);
+		return sctp_stop_t1_and_abort(net, commands,
+					      SCTP_ERROR_NO_RESOURCE, ENOMEM,
+					      asoc, chunk->transport);
 	}
 
 	/* SCTP-AUTH: generate the association shared keys so that
@@ -615,9 +617,11 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct net *net,
 	 */
 	if (sctp_auth_asoc_init_active_key((struct sctp_association *)asoc,
 					   GFP_ATOMIC)) {
-		sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
-				SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
-		return SCTP_DISPOSITION_CONSUME;
+		if (err_chunk)
+			sctp_chunk_free(err_chunk);
+		return sctp_stop_t1_and_abort(net, commands,
+					      SCTP_ERROR_NO_RESOURCE, ENOMEM,
+					      asoc, chunk->transport);
 	}
 
 	/* Reset init error count upon receipt of INIT-ACK.  */
-- 
2.43.0

