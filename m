Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032837;
	b=awCPr/jvKmoRq2qQQkpSdCgOg4iLBhwVEc/adktjQAQUeHu+x3fqmeB7oIs1u7zh2KU6
	 pE/4JJPkpCS0z8XkAZJ7mOJhKYZotTG0GMOxxX/OU9UsL6PcyxuLguQYIiKmcQNYM1zTm
	 xxes5HxPyM3C1DTzXZHfYd9LEM4RUTECd3QIplUnh/nPyFHzPcjLQEC5g7bEJyc7V8E09
	 hq24f/aDhrkGqBmZD/Y7m/ITuwfdsYdBgU3Cg+2aguf1zg9u/x51rIEJhSzZr2nboloBS
	 6thx4hlIguwemO/W8LPNNuaaKISChjQ4S6J9cnSIbgv63YqxqwyeoFfLa7HJcdKYNBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
	b=qliX/e5jJK6dhqy87pRlalrrafVXHfPR/GCy6uZ+89AKJGs5TypfiQl8l2VZP4LOT6Wr
	 v3ScxUwI4ddRfzugxUR8EB6lyuhW9/Gu1nEdidS/CayfxJMb1fhqqRMRn3nvxCO0cxW5U
	 zHN4uFpJUK9KeS36Sp+U+bgxqW19tsJ9Xh7XrMpjYTSWEyTSBccc7xikQ+ljYdTGEnP/c
	 jjrlvPMGwTkXvIo/H7VZo+P01UR7sgQ1XLUaD6DkmMrhG802jN+qV7bYJoXmtQMdl1+mU
	 ej3+PU/2Fv1jH2ZFKC+M403j4WuUyvqeygwkGG9LPub6KkzAYdmUWyOzkS+DpcSeeEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF760A262A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AF760A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsALQCsu
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-930c0f9c1b1so158739685a.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032835; x=1795637635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=AeDF5DrDQpkB6IhnLWOTwQGwhKXtNiCiP3DNMqMLorhzroRNNebdN1Sm7TvAa5Cwce
         vh2dCG0bWMtCiaWn+cJVHYKTLGEOddFnByvzw4O9ezF/SwbEgQT8yDsOMBjF0OdiWbYn
         dHG2CqBEbrci9bLffDERnkVIdz5Y/LLsZE4QnUdcAD8IPHIoBCdJzvyFGYj1S8Wr+jTe
         RV39R9k2lWUyN1I172BgVV0qGM782GomBm9IJt6tspWblBd1O6gQMPL3VJxGwoANhGdM
         MjNCfaDmxD2R5PBHquZGieNf4sn0ea0G6j8dHIQzbkeu7Uk3Ynue3ZCF7FtkLv/xHMre
         Nsag==
X-Gm-Message-State: APuU4Z/cNVSUyLZ2mO6hKCVbq32gbGwjhnbB77LOZRm5ayqRk5J2m3mz
	WV+bAQ7HydwFKhCtdxXpDOlMOLY1or/XHE+ZUkO7E1TpN+CCVUSMp+tjxPvB0Bqc7+tU9oG8Xwa
	0ilLpXxW6qb+SW6lIWaCv4Qoia+F53hpM9RhEpcXrbRHeDg8YlZ1oLpCPG31D2leMJlMU/KeMYK
	UykAzgS1HFTz64Olx2enUrHoetReRZ9OZP7+vEKAruRwtC0+UF9eUiy8yGzLP7eBKn/N/nuZQ/r
	f0O7j7b1mE8kb72
X-Gm-Gg: AYBFou2n9+m2WAQrf4lShxMHrpuWQuSyDFTUaCIXUun8YFa45+LBWPQ0HH2ATnS/XZz
	UZBYnmvHsPwqNm+ssfimwpxSQ85La/QtMxgzfW2b4nYc+rbodL9C8GrFFTfMgpbAbrCHeZDJ7Y0
	sZ1V4lH3fOg8NFJ5po5cAt+wEmcuZpY2+KrFyF3Aju5Q9Te3rZiXccLpyIySoiNPJIlkolFQmg+
	eWX0zoOT9DxpVyHYv9UFXW3uVo77e82s+mSq8JHG7Lhm9OOWAahyTv0BMYLyNKRibsYIi6xUrXc
	gTxt1VI06scDP8RlhtgJQ/Hy2wT6iMxhK32BtCM6CxKqFVcY4wOYuF20puEZLllKVsOln6zLoaw
	sXZSjg9mixDSXfbdeS7N2zs23uxga2CXvlt5J86qFZzSVBnmgszM8pgI28yZyxFm1w4ld8mdc7F
	bKInGejwKDUpQ0/2bU9eoc7NCC0fkdGlVXA79Xsgb322Q=
X-Received: by 2002:a05:620a:44d1:b0:949:5e61:97f with SMTP id af79cd13be357-94999605c52mr703698785a.69.1795032835409;
        Wed, 18 Nov 2026 12:13:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9499b71a95esm25046285a.19.2026.11.18.12.13.55
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d414ff1e9so25980611cf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032835; x=1795637635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqEoSsDLRwiTtXF4QHzskVicsJt/6mayXvEhwI8woOU=;
        b=EsALQCsuXxhjbc0jqsPBQ6PY9AW7CUvHgg1WNFYHBdp3+Og8jxPxQ5hA8y1U4b72Y7
         7uPr8RyKF+Wd802sl5mW5dhHhacdP3515QnUN/OfZ2kUbIu1czYlJZYqgejHkoW3rRYn
         KFpqZ+gkZMWULEQXh6Igba9wdIX3gLZToMuIA=
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137871cf.48.1795032834674;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-55d5a622c5fmr62137191cf.48.1795032834127;
        Wed, 18 Nov 2026 12:13:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 2/4] netfilter: flowtable: restore the GRE conntrack timeout on teardown
Date: Wed, 18 Nov 2026 12:12:48 -0800
Message-ID: <20261118201250.2075007-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

flow_offload_add() sets the timeout of the conntrack entry to NF_CT_DAY
for every offloaded flow, and the GC keeps extending it for GRE too.
flow_offload_fixup_ct() only restores the conntrack timeout of TCP and
UDP flows when the flow is torn down, so an offloaded GRE entry which does
not see any other packet on the slow path stays for up to a day instead
of expiring after the GRE conntrack timeout.

Restore the GRE timeout, replied or unreplied, as for UDP. GRE has no
offload timeout of its own, flow_offload_get_timeout() uses the default
flowtable timeout for it, so use that one when the flow expired.

Fixes: 4e8d9584d154 ("netfilter: flowtable: Support GRE")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9df..051b15aecd89 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -237,6 +237,18 @@ static void flow_offload_fixup_ct(struct flow_offload *flow)
 		timeout = READ_ONCE(tn->timeouts[state]);
 		expired = nf_flow_has_expired(flow);
 		offload_timeout = READ_ONCE(tn->offload_timeout);
+#ifdef CONFIG_NF_CT_PROTO_GRE
+	} else if (l4num == IPPROTO_GRE) {
+		const struct nf_gre_net *tn = nf_gre_pernet(net);
+		enum gre_conntrack state =
+			test_bit(IPS_SEEN_REPLY_BIT, &ct->status) ?
+			GRE_CT_REPLIED : GRE_CT_UNREPLIED;
+
+		timeout = READ_ONCE(tn->timeouts[state]);
+		expired = nf_flow_has_expired(flow);
+		/* GRE has no offload timeout: see flow_offload_get_timeout(). */
+		offload_timeout = NF_FLOW_TIMEOUT;
+#endif
 	} else {
 		return;
 	}
-- 
2.53.0

