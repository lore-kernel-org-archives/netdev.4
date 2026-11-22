Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391851;
	b=vXfueD55SfLKOQAj6iQNCZJLx8yjaKwMVSMlhn/fVXVQnJC1GHqRIJbJO/0C2K5/tU1u
	 sqUDWXn5GTCMVlSikcAlq/qtr5yEfYbIH3DVLShT2KS8Bf2aK5TQCdHka9b1veVmYTUOn
	 vlxQe7GEW+4SIo5213/JtOuEHGfrewvet2UHCZ7N+bEDctQiAN4RuZxZZ9ZDC57i5SekF
	 Hob2tqLdMxpZ4Z6PcYs+9jrBKRR/Ahaz1jlWcp8S42a0F+dPXNeOk8zuk/HfAHlynBrpe
	 inkS7Ht9t1no4z1HvjAFcmZ6ov6KFo81sNmF+++bumDwexfelBnvu6ZwUiN2PhsFxrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
	b=Jv56IKt7FpGOYPe9HxTRGtmQq5y5jWC7aK+XrT5SnGqdj+fMfhukH58FE2MK3uC3RAYF
	 4FhXpVAYpwJ6VRAmGblg6dXof6X5M+fgqs0tasntezFpPS+cWC0qcYrE0LEe4fBdFUGbs
	 cH927XgFalY4dk6VAAvp96q7e9XpSbrqxlwfRAh+rmsBIB+aDi9dZXedv0/R+QZ4gargY
	 2kJNd4+CWL69A858SPN+ipinFtJhHoXb2QL8dEhIM9zOV0rLBRbJdi9kLb4amWoRw8XST
	 IyuPXVdTgPD8wkRaZsOLj6UFjCNZNszDz3uwo+/Nzr2ToU7QqtvWp1RbQKVmZgyR2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="I3i/PlYm";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB4606A339
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBB4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I3i/PlYm
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so1134799eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391850; x=1795996650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
        b=I3i/PlYmvH4nq8usn6zSpiJtrQCHo8mtU3SWKpQE/ln9jU3tcy9VlPnC9lH2RRCNgx
         Aa1pzAKrhVoVKR3dGWiglYDJanmgiMlcCwk5mhS7dM/KaUNYi1tqi1fYhgTh4iVxK2Ht
         Wt8/L9EekuNk1cB+sZUvqiXh35kmmMMZPsNLjyaTx+eyLDnyrBsZcZuAF+ByVJKbOCRp
         tYamfeCjgThb7mrDMLnIb8gmlnoeYeH/AkQ85GlfJgHizZXikl1B/O4DRyFLfOntBjCI
         fesx0lZFBkEfU05Wzg6mvns0H85RIZc6Sp/KqQjCS5sB+7AvyCZXm1BK4gIA+TZQ8ZGm
         dCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391850; x=1795996650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
        b=UKacpQhBNEt8BzMZ2x4UsZ6Cg2dT8urJgCxPtSKmP5lcNui+QmyoCASP2J2qEOPVMO
         8Y7RaN6d48tG/LAturygFuX93iIoLjNqZfk5ywf2MVJuxoYGxWielj5cGi+RqtQrWrj3
         tAqj2+lkJZ7rTCUCE+Uu/cy+WCqR88Akbk0e6BNBMDkyb+BnPWV5SbktRqe9TQNv2PpH
         40zTWHmkSbCV0Ydy/yU8JhRThUZP26BVktxHdlgd82AdWRbkB0BU2KJpiVLBgdh7JFZ7
         Bg2CUPvcpxY9oCQ+hvacDDnr7TI8nZaxcF3EIcxrniWjU+QtyErsimTcR9I3o0fhYlh7
         0ZCw==
X-Gm-Message-State: APuU4Z82S/ohzvccgS5SsFAbbo3qHPr/I620lU+xTNPLFdeZRSml3JrI
	Q3vFZC5f0FXfUl2WJTUhxbrxoxloK0jyZuMmnyNfZRwZ6NCdrTRPvcLVblDvTVZtCU5YP1BEIAH
	UDFn1
X-Gm-Gg: AZFdTZcWqFgBDGVV5QexCdW47FuS/ZouJ/xB38BWsNPqQh9UMvAnOUrhj6oPkKuCrhv
	1jir1Hic/jl688g38Y9HgJJ1LmQRRmtlcUPNDqSgX9MmIeoVJ4skjbilNoJCupJHV5otahHlRke
	NBJlIiLAnuKRTmDtnnsa3zBmY+mgfz2rDi5DhznZO8YjsXxhHWBeVWYkV5K22Iv6QxnjYlrz8K9
	JJ/V+9yWUqZekaDiDY+taasL6jui3D3EyBjjusxX/ymlHNbA2BMXNH8bWnPVmNeYxSgqxIaf/LO
	H5IMqcqSy8SIYpiurm1gKazTGqG1cqK49c1W9qW8hbhaS/qO3vtmmMA38fd6+1LeMiuHKexoJ9I
	FnqxBkDWRWNhi4ev9zT+fKkVsJN2IG1oudA51WXiwf+pjbldw8n60xZdQmsceamMxMnSBxQlV29
	dT4Or7suvORbUpBx3j+GkiMuHVr7S7nKfQFup2jdam7dFVEkxRNtI4wQM2eR1VBFtg/BYsrMPG5
	xCoTzmw/sHJmVYGmE9a0CIJEaQ/9gaE039x3zSeWP8XYfGkPJKd75nznlFvKicfODDZPE3m4uH/
	wgllP2+ATQoafKIYQydMgxVWyFhUDRnTXtc1B+CYgh7gvvllHxIopmOyLm2g9RdG9N+9O0QiQ+c
	UusYYl4epSil47hyK2Pqa8+f3MT3jXkNA8SjQodk0slAvl3CJ5Ec=
X-Received: by 2002:a05:7301:7e07:b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-38570e21c39mr10880754eec.31.1795391850306;
        Sun, 22 Nov 2026 15:57:30 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:29 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v3 1/3] amt: make the A-B source walk linear
Date: Sun, 22 Nov 2026 23:57:22 +0000
Message-ID: <20261122235724.2898320-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122235724.2898320-1-omar@blockcast.net>
References: <20261122235724.2898320-1-omar@blockcast.net>
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

amt_lookup_act_srcs() computes A-B, the sources of the group's state that
a received record does not name, by comparing every source in the group
with every source in the record.  That runs under tunnel->lock in
softirq, and only the packet length bounds the record, so a single
Membership Update can already cost |A| * |B| address compares at the
current 128-source default.

Mark the group's sources that the record names with one hash lookup per
record source, then act on the unmarked ones in a single pass over the
group, clearing the marks as it goes.  The cost becomes O(|A| + |B|) and
the result is unchanged: a marked source is skipped whatever its filter
state, exactly as the pairwise compare skipped it.

Found by review (Sashiko, on the limits patch); not triggered at runtime.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 43 ++++++++++++++++++++++---------------------
 include/net/amt.h |  2 ++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3ca..79d68bcc7 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1649,7 +1649,7 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 	union amt_addr src = {0,};
 	struct hlist_node *t;
 	u16 nsrcs;
-	int i, j;
+	int i;
 
 	if (!v6) {
 		igmp_grec = grec;
@@ -1705,28 +1705,29 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 		}
 		break;
 	case AMT_OPS_SUB:
-		/* A-B */
-		for (i = 0; i < amt->hash_buckets; i++) {
-			hlist_for_each_entry_safe(snode, t, &gnode->sources[i],
-						  node) {
-				if (!amt_status_filter(snode, filter))
-					continue;
-				for (j = 0; j < nsrcs; j++) {
-					if (!v6)
-						src.ip4 = igmp_grec->grec_src[j];
+		/* A-B: mark every source of A that B names, then act on the
+		 * unmarked ones in a single pass over the group, clearing the
+		 * marks as we go.  This is O(|A| + |B|) rather than |A| * |B|.
+		 */
+		for (i = 0; i < nsrcs; i++) {
+			if (!v6)
+				src.ip4 = igmp_grec->grec_src[i];
 #if IS_ENABLED(CONFIG_IPV6)
-					else
-						memcpy(&src.ip6,
-						       &mld_grec->grec_src[j],
-						       sizeof(struct in6_addr));
+			else
+				memcpy(&src.ip6, &mld_grec->grec_src[i],
+				       sizeof(struct in6_addr));
 #endif
-					if (amt_addr_equal(&snode->source_addr,
-							   &src))
-						goto out_sub;
-				}
-				amt_act_src(tunnel, gnode, snode, act);
-				continue;
-out_sub:;
+			snode = amt_lookup_src(tunnel, gnode, AMT_FILTER_ALL,
+					       &src);
+			if (snode)
+				snode->sub_mark = true;
+		}
+		for (i = 0; i < amt->hash_buckets; i++) {
+			hlist_for_each_entry(snode, &gnode->sources[i], node) {
+				if (snode->sub_mark)
+					snode->sub_mark = false;
+				else if (amt_status_filter(snode, filter))
+					amt_act_src(tunnel, gnode, snode, act);
 			}
 		}
 		break;
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba097127..f36efcdd9 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -287,6 +287,8 @@ struct amt_source_node {
 	struct delayed_work     source_timer;
 	union amt_addr		source_addr;
 	enum amt_source_status	status;
+	/* Scratch mark for the A-B source walk, under tunnel_list->lock. */
+	bool			sub_mark;
 #define AMT_SOURCE_OLD	0
 #define AMT_SOURCE_NEW	1
 	u8			flags;
-- 
2.43.0

