Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556669;
	b=C6MwDepPYHxNj7KTqM3beFLUyuLlePbQfKrs5tD+fwhcTkynKimZBIo7joQnmw18Gkyy
	 4Uow1J8O9I7dELcqZ1k96ZAg4MIWoGR5XtlA4+dbG/nPouIXsSAvMYutq2X0d7phh2aN3
	 iD8y66v3dAopglsLYqIeO+2qdHZq6MkIcw38oDy7gtkIzbxhOAO01JgJrGKrEHc02gEES
	 tfj9kpamDGbr1g8BkTJQrNCO1yrQwWyBmSGGKo1CGdaDzn3mh1mwFbHrISaZUORrL81v7
	 sWa92hy3QZ/X3tyzMrEl9ZPx4sH6rPaU6/8LgZnd3flr9wle+56LzRZ41sXGbpYV0zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Subject:From:To:Cc:
	 Date:Message-ID:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=X3nIlMi8A8MUq2MzPjmYWXls4ZxOWKVCCUt7YwIYH2M=;
	b=H7nZ/YEHmvypZNFPSJPDvKyvFzvrt2zSqln7GzWqRLM4jnBMva0LSqtsyKlXH5RAiHre
	 vwLQ+PaXEsb+S5F/35ud2qmysrJxR5ovzSnGzDno8X2HOq+s4r+QWtYpmKAM+Rgn+VB6x
	 BrDQV/m2jO3YY1MCVT/IBp2xd3VA0iH4PLatAKq906HbfDFVbYWOJ9ywp58LB+Yotcjf5
	 NhSEb9oFB+jPB6HFwdNjQIPUBhsEI872mYfdSldR1ejsRxHHrEaVOEwyfd9i+5H79SL3G
	 dvZrLs4IrKrsjpkppqn60cpUZC7vC2O2e2NnNJK8YSxY6kxjAyJPtmXD0xiKS2ldhDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nD8IfCY+;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF9606A33C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BF9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nD8IfCY+
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efe591a1f6so17047515ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556668; x=1796161468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X3nIlMi8A8MUq2MzPjmYWXls4ZxOWKVCCUt7YwIYH2M=;
        b=nD8IfCY+be8eyRv+iDHEGaESLqLRmK/idE8YO5BdDH06FYRnPSn+L6w//LDYn7ZNdA
         KRbm9gvncZvwtK0BTEMeYs0bbuQKssfOtnxKFqbwJQZXT2zRroQuTsaovVHvHo5om19U
         NKGQKFE+QM4IjL//ITsk5dOAB/SdWR2q+eI1ES+WLfLCdP5NLgsCxPirUMRir7oiUmQ0
         JelfAlQxKBd0uLOvmbDfAk+gxVhGF9lAg68BHJ1gts4AkGJhjcLXvVP7ayZcl1sL2TNw
         8jb64SNk1VGFRushxCXnrV+FzvAXRb7Rk6mmBGHmKvwqILoKTl6SRULup/rnIb3YMz8T
         N6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556668; x=1796161468;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3nIlMi8A8MUq2MzPjmYWXls4ZxOWKVCCUt7YwIYH2M=;
        b=Bmk5oM/s+DbUcltokaP/8jiWYuhuATbTadktNWaI2LWm3zRNEcENXv9bcm0soLT1N0
         wgb1UoA2+ftte+nc1RX/AethRo7fuEbLcgjDRUgOuhEUDaCY4/5HeaZqeaJE2MuFnEC5
         ojOsNCuvdzErcqdAy4VWOzInmHJcSj2ZkVkf4G+B/pLJOfQCT5TaGNwQ1SHpnFz71DDR
         WabgY7QPB/Hod1opl0sQJZylXrTmZOUoPOIDYJ+v9zJCt7dyxk5RW+OhsafjuSBh3Fjv
         nqMYgat+kbq+VgwWz17UkK4VVVKaavhQ8F+yZziWPzAgWj16XGre1xMUW2N6A/MWD7a8
         QLIg==
X-Gm-Message-State: APuU4Z+f1K7b7iK5bJjIhKJ1CXYFaZqxEIy+hm8q2mvrUmydTQ/ML1E4
	UpkmJ6klqJ/ODDkLkTzn+xNGURjx8U4PJiMpRc3jQ9I7IbirNu1to5cb
X-Gm-Gg: AZFdTZe3WjsTDO+jr/iU1SHo1z6r8drAsv6XFdGmpjsPOQXxn+XlbtPYuD65F8SR4e0
	l3QVYYJeIJZ+KHQfOVK7/n8GjId6UrRsFsnalJU8MfdZRpfaZ4plG3ZNt9LFDUDrD9caa+zIUdV
	SHGSTBxJXGHPC4DKSekiRdt8ieh0ReOzlEyh7N9rqVCLZQ26oEiQGYBN3Vnf7lgRu+9gWksK94G
	wgGbxyFWlWJqtOZUVrriE30lrQ0h1pEvzeWeGQwRDv+84EwBNT8nFAZNbTP00iTHUpXTpcpSE6s
	tY0Krzj4ybfF67DvSBJIXojpOdjocrtF4oueOPFuRS7Y+0FUUE3P9zU2uKrhEcbFh8JJXFGwuFW
	nTQw1t6HYj3BEYRdYd6yxiZv5Q9AMaw4l4Lb3GBPlX8rnLzqxNIoneitO77GpdTSuPCKoRatFCX
	VptV5jkksNCeuhRR53PG9U5vYNACz6hGU4zIUruOxGyuRVJ8qu2oQ9a4+SfF30a5lV00Ps86gkS
	kQkce/70nrbh5p0iHp58ivRqRul/kIlBi1uHbHe3Z4W9Bd4DY5CIqAFNWs+lqzg7UjFijRNmNDW
	xL2SdiuKp4mH4pAPSOrPJ3M7F0oMnGYjZAutWOx1JANe2KFDCF1EJf+n6Md6YtuXX/wwk/EwkiD
	4wJHxV5iozn65MWTd+w1SYHDsuvr9bJdTKhaRDJO4TPiPsw==
X-Received: by 2002:a17:903:41cc:b0:2ee:1a20:2276 with SMTP id d9443c01a7336-2f03ef870ffmr153046245ad.8.1795556667764;
        Tue, 24 Nov 2026 13:44:27 -0800 (PST)
Received: from ahduyck-xeon-server.home.arpa ([2605:59c1:38c:400:22f5:2de:b9c3:f27c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm74329135ad.53.2026.11.24.13.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:44:26 -0800 (PST)
Subject: [net PATCH 1/3] fbnic: Limit TLV_MAX_DATA to the firmware's 4K page
From: Alexander Duyck <alexander.duyck@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 13:44:25 -0800
Message-ID: 
 <179555666503.7867.5412092334351708366.stgit@ahduyck-xeon-server.home.arpa>
In-Reply-To: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
References: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
User-Agent: StGit/1.5
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Alexander Duyck <alexanderduyck@fb.com>

The firmware builds and parses mailbox messages in a 4K page, but
TLV_MAX_DATA is derived from PAGE_SIZE. With 64K pages it becomes 65024
bytes, so FW core dump reads fail with "No data for core dump chunk"
and the dump is split into fmsg items larger than devlink allows.

Base TLV_MAX_DATA on the 4K firmware page instead. Nothing changes on
hosts with 4K pages.

Fixes: c6203e678cc9 ("eth: fbnic: Add message parsing for FW messages")
Signed-off-by: Alexander Duyck <alexanderduyck@fb.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
index 9c4e4759394a..92d2817d0291 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_tlv.h
@@ -7,6 +7,7 @@
 #include <asm/byteorder.h>
 #include <linux/bits.h>
 #include <linux/const.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 struct fbnic_dev;
@@ -82,7 +83,8 @@ struct fbnic_tlv_index {
 	enum fbnic_tlv_type	type;
 };
 
-#define TLV_MAX_DATA			((PAGE_SIZE - 512) & 0xFFFF)
+/* FW mailbox messages are limited to a 4K page */
+#define TLV_MAX_DATA			(SZ_4K - 512)
 #define FBNIC_TLV_ATTR_ID_UNKNOWN	USHRT_MAX
 #define FBNIC_TLV_ATTR_STRING(id, len)	{ id, len, FBNIC_TLV_STRING }
 #define FBNIC_TLV_ATTR_FLAG(id)		{ id, 0, FBNIC_TLV_FLAG }


