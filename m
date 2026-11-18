Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032834;
	b=sJ8KDJ5R1yMRzEv20iveB7o+qQTpvWUmB3kvlQoL4E6c0mbX+PK9F63Uul4hVxVnvSmk
	 9WfALI6qt+uUVlTDMJosj0NRbrzx5wM+eB4a5+YwDYl6j22sH8Mr/MAvdrrlEAw2utlKW
	 SJ1aOa4zOGUvSXuPu3L6NB5zJnqhqCVtDtRSzV9VoJLVsWQyC2aDA3ewdTLZI+6azypJs
	 gnu5Dn29QUo2eRTlx5AindS9OQRyzWHYq0az03ogUkHCXK7m+60YZ7LPpfCM+cL7caLw3
	 drZyKQ6jnXVw/pLa2Cvlp5psIrTWpOqQn/mEVl7BdnyqX/utXk1jUIamJ4TBt4Sip1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
	b=TAhCA2sbATebPOhiIMeokEogSxYl4f2Zrr8Vuzv/TLl7v06jIAI/OVpXRxGdDTafJIhu
	 diCNpz/KU23LqO6J0LKvJlL08htPBIHP24PQ+dhVOVtBD4vwAwyJUrPVKzfpkYtuohGt8
	 G4R4nSgqArqz4flu4rck8J0cyutCu9OA6OS+fztsMhfFxdijCqsOuiZYLAauNAHlVz+Hk
	 deBjQHhYQdrejDgGrp+D1rOIMgvwvM/X+jk+yAtE9TzR+3lcXfY8fr22wavDUrBUIj031
	 QgGVWWFdh0T0k2KIncqFqCFkQHKzG/eX7LesL1qqChwGAg5+nSL1uzArlaXk/OAjNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA460A2617
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACA460A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jpep7sDz
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso722596a12.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032834; x=1795637634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=yN0HAr6u6nR1McFF9MncTrZXnl/BDO26OZRUchQp4IctC+IqCur98xnjpoQDlhT3Sc
         HXyLEYqYjNHsm6hsJOI6+4ibP0oZsYY9+p0cO9safwOvjN/4ri2K/USwr8eYI/xnZpjV
         4SmZ0nHAyTDNoMLJRmy4ft5WYPxPHc2GJkrXCNE704W8+I4caA8ziU0vMcajwPlFbUQO
         TGauU9Sa8iThIQ1x1n8qsKuLnYz09gvz29g5HObZwZwsEwl5bF7C00gfsRhg5JXznjUr
         hABPPVwNDOVR5QbgH9B4lUX5/VuRSvQ6LoFgOCUJRI2F0+YENOTa4JxxEXY2qcnoDoAO
         dIMA==
X-Gm-Message-State: APuU4Z/BoLIqXI26hWDM7udPWDESTWtkWrSh3iubZMez+dI22VLIAvh3
	jLwR4oC/7eyNjnLrMuDPQHKsHiNbpQ53jrmltf6/5PiptL+6t6TH3AWFDSBLp1Ij32+/kR6DVwn
	aEL6+RgMZfDGCCSYGF7GfauLDUzr1ty6vV1AbBR5SBm1mD0Tlbni2G7IbBGHDsArUfDUwmgyeo0
	8EvKsCHP9CpQN2c7qGNFvV5v0JiyxJq5mr5wpiunWoWoRo3amUlbcDTF5bImMY301gxgaU2NJ6c
	TfDi9/4ju89Azxl
X-Gm-Gg: AZFdTZeHnNiEzcRkWYLam7Mc7GaE3vJkFbys0eK7kN1eqKeS18L8eWDI9y5ieaaWV8U
	uOZzkDmzLiq3DugvpxRy4OJyO451ya8BE5393Vh11R+3X8GwfMIgBCVUoHA5VZNeBQ/h7wFnkP2
	89BxoinHrZhz4F57EyaZfpya6Axs0pQlbDIn6gggJWfKChFm+3nk6u+Zs4iMGLztNH1EqJ191ai
	BNCN8oVZWnaZEILi9fKUwEjtrNbyNXJRYOH9r24Gf0u7m/WnT//0lVJQPPeIVYNM373QDnawpr1
	WGDHbdJGQiFmOVPzIy3EfjwxqzpwB8RsO3wqcIYy+yUduQ+2BWl1teDcI05uL0l4SvoVmDBwL1e
	nx05+Hxz+L3Y1MKbMNnj+6g0sall4efaErb4YnLs+mjbMF2rljWatfWcdEFTzrOsv71/e0Mbjb4
	5Qn5waaq/nDrf9wvoTeFKRNPFc5FR/kURdhErV/4i/
X-Received: by 2002:a17:90b:3943:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b3d07e0a06mr3149881a91.50.1795032833616;
        Wed, 18 Nov 2026 12:13:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f68811fesm396033a91.2.2026.11.18.12.13.53
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-542fc61841eso25872321cf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032832; x=1795637632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDXhbpMKUl7ISgBnZfj/IedauZ9SDiSIZpfzv9Z13y8=;
        b=Jpep7sDz2EJWI9hZMR2W0pc+SzWJf4CIrgdpDZqXr9JYyExwWMH71NbYuJ6s7WyY8B
         HlAplMcZDeObXddACBH9ztkkIgoZEsz9dfhA909cJyu4zoNjMwS8KFffuFaJdUHa+bti
         IM0ZeUpvk6UGOin1OLdfHMySzP6fXtO666MoI=
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52255541cf.64.1795032832358;
        Wed, 18 Nov 2026 12:13:52 -0800 (PST)
X-Received: by 2002:a05:622a:2306:b0:535:a5fb:6446 with SMTP id d75a77b69052e-55d5a7351damr52254921cf.64.1795032831764;
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:51 -0800 (PST)
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
Subject: [PATCH net 1/4] netfilter: flowtable: do not queue offload work after DESTROY
Date: Wed, 18 Nov 2026 12:12:47 -0800
Message-ID: <20261118201250.2075007-2-florian.fainelli@broadcom.com>
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

nf_flow_offload_refresh() can be reached by a packet path reader which
looked the flow up before it was torn down. NF_FLOW_PENDING keeps the
DESTROY work from being queued while another work item is pending, but
once the DESTROY work has run and cleared the bit, a reader can take it
again and queue a REPLACE (or STATS) work for a flow which is already
being removed.

GC removes a hardware flow after NF_FLOW_HW_DEAD is set, and frees it after
an RCU grace period, which the reader can outlive in a preemptible RCU
read-side section. The queued work then dereferences a freed flow and
the flowtable, and can program the hardware again with a rule keyed by
the freed flow's cookie.

NF_FLOW_HW_DYING is set when DESTROY is queued, and DESTROY needs
NF_FLOW_PENDING, so a work item which holds the pending bit and finds
NF_FLOW_HW_DYING clear prevents DESTROY from being queued until it
completes. Check it after taking the pending bit, and do not queue
anything other than DESTROY when it is set.

Not reproduced: this is a race between a long RCU read-side section and
the GC and offload workers. Found by review of a related change.

Fixes: c29f74e0df7a ("netfilter: nf_flow_table: hardware offload support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6..62f460d38efa 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1088,6 +1088,19 @@ nf_flow_offload_work_alloc(struct nf_flowtable *flowtable,
 	if (test_and_set_bit(NF_FLOW_PENDING, &flow->flags))
 		return NULL;
 
+	/* GC only removes a hardware flow after its DESTROY work has run, and
+	 * NF_FLOW_PENDING keeps another one from being queued, so nothing can
+	 * free the flow while this work is pending, unless DESTROY was queued
+	 * before we took the pending bit. A reader which found the flow before
+	 * it was torn down must not queue more work then, as the flow could be
+	 * freed before that work runs.
+	 */
+	if (cmd != FLOW_CLS_DESTROY &&
+	    test_bit(NF_FLOW_HW_DYING, &flow->flags)) {
+		clear_bit(NF_FLOW_PENDING, &flow->flags);
+		return NULL;
+	}
+
 	offload = kmalloc_obj(struct flow_offload_work, GFP_ATOMIC);
 	if (!offload) {
 		clear_bit(NF_FLOW_PENDING, &flow->flags);
-- 
2.53.0

