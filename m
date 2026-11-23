Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442021;
	b=vwkvjXxgHTYeI9bw+fBHwIrhxHeND2cRzXUs+6DHNFgwkKOUuk3wgdqHLALeoOLXckcm
	 ALH3FBSFNuRcZz7s5yxdhiwGxUqmtdYsVtbOZ6blw276Go2Kb7D1I/Bz9cnhJzDtdCHnK
	 gx6MVFMgwkHhOQ6y4wxY9Jy7vgKYgo8OQjp+sdQwK7SHgJILyeaIxy+gJeHI0xN8kQgbE
	 394CVDh+F0ZICS/U3RrUN6ifG/2DKYCCf+ZtwxxDt1a5/aGEXyLvgHrkowhz27jtixotR
	 yrLFKsXhp3UTeHpb7yPwvf2TfAcRUHg+FBlfKDSUII7NO+dz5GjSUNjP1E0PQjSL+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
	b=rWH9LuSww7k4pL0XtigCjkzxp7uTt96ZL95kHP/GKWG2iTuNtllFVnkpv6U/E0uvOEEo
	 iSohBbFklI/flg9QCSE4zGwlXKWu8MgMcb6MWwUk5uypcKJSHGZOWzXC9a7OwBMUUBKAO
	 1deyUsLhuvsDUHT6QmseTtC38SkjeUeYjVqHwpF+R5AsK/aNL3bZ7+68/7WQhzJXCBqbW
	 kvbF7xK8YsGJnWBmlbq1G2FlpngF06GlFkr8x0i4n/yeZ+T9BQZRcqdK6L2mAVYl3V/A5
	 0v36VgGJzkYNf0kuCkI4IlQeVAty9e3r5KwQTat4FU5pRFAQIvWDxOwKK9Su0lOricw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=YF6GU2Mf;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F58606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F58606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=YF6GU2Mf
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1072383b3a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795442020; x=1796046820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
        b=YF6GU2MfzFL+xw6V4/1FgEhvCJ+SGtt7ZwKiCq76seKeW2U+Gmqpj4vH03OMUyVDDn
         bbKQCoH9Sz4bpDHyQY8LdxiQudYEt4WlhgauW4/H9O1bFOZxObOgqoLBVjW1cnxmAi/j
         UBvrOYUztODKaN999/b5ZgmkvhcpiB4UKNcEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442020; x=1796046820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
        b=vmHdZX3urEJafniU+6B8sMWO6vKJFGHl6jyLlSFLdGi8vY7LohzvjSZtubRDsIW43a
         s1LCdOnIqw8g0x6QeX0TjlCjg+eqo3VssXWh2oaqBwB6SAqsGhxoX7FL7Mav2KoDt73F
         A1hua1hD+RgcaXLeU5CqRjA0Tdvwm61k5M5w315int0hoU14z/y1OYJ+/kzW2JHXYY4G
         HzDpOduyr4cvtI4RwOCZhIl2w0zS8vA1QDoQhlI4ci5aKmYcBCwYUR9IxCBQoB0xWNrR
         8fqscAaUBIjMPPGi6wW15DtmsUEfHP159j3nfAO02tyBlRkMr0CMbcicpu4ijIIyvJM6
         3GHw==
X-Forwarded-Encrypted: i=1; AL+hErFFNfDdTdao4O6ErauOZaYuGvUV9I0PXyHiiOopitfHGjVh6YGb8v3TVZy+WiBLXjlwl5gwRCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z99O7WlLmqRQWVvlJImzH0Sgdn3WygE4rpJ2Jv8avGDHnih2aNf
	8RpY2wSS6BWQxQqq3eO99DWOhT/lBIO5adDRnCWYOTXzY8ZPg09XkgguDtjZmWxfVZc=
X-Gm-Gg: AZFdTZfuS+zjyj2Sj7vfxTMwk05vqBUJPg+5aDqW2z3SVhfSVVu0Blh7JPQJIR9aCa3
	sflfJjJZDphvWsbZBdJMt7hBEqYfsnF05csHRs4i3Vhqqjk1vfCsWvN8R6CYJGNiWzlCb1NqnCh
	U4tYeag4UCfbdWVr6z38IzIcILMMTlZt7NVERwa55quyL0d7xOaAEa+Z66HlLrKaKtZ8VzP+8pX
	2NVPrzfpmDj9h83bc50DlZM4uO7UH5+ngA7/SElWeKRfVsE9Ln8hi1iTVOSxA2kKdC3Lr1jr0t7
	1yDgdC3EAHjG50vNKUh8YbO8C1qCZQy79sFON56LK5dGRW+QwHpwGBnHd9DFlpNvKzEyZluunwt
	t1zH3GvVMMH0zwL8TFckER7K7qVIUoZs8CjK0mT9SVe3vzLElng/vT+jbAh7vUqxlZrbRNpOIjC
	UY+UzflWRzHKGc9TP/K3JaEdRD/4RziYlDSZxiuWOVoSCm812bwulXwziyiQ0WB/nLFuF6geEva
	2GmVEHHlMaIuzYgkvo7ibQO74CvlTYT9e1LBvroPK2bhdrVrQtOgtfOxWYvQWKCAWW5ZNSX9v2T
	cld4UcJnFbGaHLGCKWgjJA3oJkKdxCrXD0XKQVCta11xqJwhthovmiaxGPnJDlQ6xJ8HITlSSBo
	U7RmJmmqDshuLkAdjPuoF0/Yl6WrUX6qj+I1jfIfn5HovHEiVEtfgq4kLWGg5e/cNz5Zn+eaESf
	3f3SfY10i51w==
X-Received: by 2002:a05:6a20:d10f:b0:3eb:9c9f:8b8e with SMTP id adf61e73a8af0-4014e74d04cmr10179615637.92.1795442020015;
        Mon, 23 Nov 2026 05:53:40 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfafsm5713466b3a.50.2026.11.23.05.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:39 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: alibuda@linux.alibaba.com,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	netdev@vger.kernel.org
Cc: Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v2 2/2] net/smc: bound the DMB-nocopy send-buffer credit as well
Date: Mon, 23 Nov 2026 19:23:27 +0530
Message-Id: <20261123135327.3953509-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123135327.3953509-1-piyus@iiitd.ac.in>
References: <20261123135327.3953509-1-piyus@iiitd.ac.in>
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

smc_cdc_msg_recv_action() credits sndbuf_space from the peer's consumer
cursor on the SMC-D DMB-nocopy path and then assigns that cursor to this
side's tx_curs_fin:

	diff_tx = smc_curs_diff(conn->sndbuf_desc->len,
				&conn->tx_curs_fin,
				&conn->local_rx_ctrl.cons);
	/* increase local sndbuf space and fin_curs */
	smp_mb__before_atomic();
	atomic_add(diff_tx, &conn->sndbuf_space);
	/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
	smp_mb__after_atomic();
	smc_curs_copy(&conn->tx_curs_fin,
		      &conn->local_rx_ctrl.cons, conn);

sndbuf_space can already be non-zero when this runs, so the sum can
exceed sndbuf_desc->len and the comment asserting otherwise does not
hold; smcd_cdc_msg_to_host() takes the cursor in host order with no
validation, so tx_curs_fin can also be assigned a count outside the send
buffer.

Unlike the failover path in the previous patch this is not reachable from
a hostile peer today.  The branch runs only when
smc_ism_support_dmb_nocopy() is true, which needs a dibs device providing
support_mmapped_rdmb(), and the only provider is
drivers/dibs/dibs_loopback.c - where both ends of the connection are the
same kernel and the cursor is written by SMC itself.  So this is
hardening rather than a fix for an observed attack: it keeps the
invariant in the comment true by construction, keeps the cursor inside
the buffer, and stops a future device that implements the op from
inheriting the problem.

Bound the credit by what this side has outstanding and advance
tx_curs_fin by the bounded amount instead of assigning the reported
cursor.  For a cursor that reflects real consumption both are the value
that is used today.

How this was found: by AI-driven fuzzing built on top of syzkaller, on a
loopback-ism connection with the peer's consumer cursor forged by a debug
patch so that it reports consuming data this side never sent.  KASAN
reported an 869056-byte write past the send buffer in smc_tx_sendmsg()
(use-after-free in _copy_from_iter).  With this patch the same forged
cursor credits nothing beyond the outstanding bytes.

Fixes: cc0ab806fc52 ("net/smc: adapt cursor update when sndbuf and peer DMB are merged")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Link: https://lore.kernel.org/all/20261122053223.2497832-2-piyus@iiitd.ac.in/

This is 2/2 of a two-patch series; there is no cover letter.  The v2
changelog is under the --- line of patch 1/2, and in short: v1 was a single
patch that clamped the copy length in smc_tx_sendmsg() and named this
DMB-nocopy path as a remote attack.  Both were wrong - the clamp left
sndbuf_space inflated, and this path is reachable only on loopback-ism, where
both ends are the same kernel.  v2 bounds the credit at both sites where it is
added; this patch is the hardening half.
 net/smc/smc_cdc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df321..9ffa3e422aa1 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -333,6 +333,7 @@ static void smc_cdc_msg_recv_action(struct smc_sock *smc,
 	union smc_host_cursor cons_old, prod_old;
 	struct smc_connection *conn = &smc->conn;
 	int diff_cons, diff_prod, diff_tx;
+	int sent;
 
 	smc_curs_copy(&prod_old, &conn->local_rx_ctrl.prod, conn);
 	smc_curs_copy(&cons_old, &conn->local_rx_ctrl.cons, conn);
@@ -361,13 +362,26 @@ static void smc_cdc_msg_recv_action(struct smc_sock *smc,
 			diff_tx = smc_curs_diff(conn->sndbuf_desc->len,
 						&conn->tx_curs_fin,
 						&conn->local_rx_ctrl.cons);
+			/* This difference comes from the cursor the peer
+			 * reported, which is taken as it arrives.  A peer
+			 * cannot have consumed more than this side has
+			 * outstanding, so bound it by that and advance
+			 * tx_curs_fin by the bounded amount rather than
+			 * assigning the reported cursor: the invariant below
+			 * then holds by construction, and tx_curs_fin stays
+			 * inside the send buffer.
+			 */
+			sent = conn->sndbuf_desc->len -
+			       atomic_read(&conn->sndbuf_space);
+			diff_tx = min_t(int, diff_tx, max_t(int, sent, 0));
+
 			/* increase local sndbuf space and fin_curs */
 			smp_mb__before_atomic();
 			atomic_add(diff_tx, &conn->sndbuf_space);
 			/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
 			smp_mb__after_atomic();
-			smc_curs_copy(&conn->tx_curs_fin,
-				      &conn->local_rx_ctrl.cons, conn);
+			smc_curs_add(conn->sndbuf_desc->len,
+				     &conn->tx_curs_fin, diff_tx);
 
 			smc_tx_sndbuf_nonfull(smc);
 		}
-- 
2.34.1

