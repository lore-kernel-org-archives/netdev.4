Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786816;
	b=Z4Nkn9EA2rPeUA+JkkC0uK4V+y4A/LCtjzPXNNcqjqdTupx96ibw+C/vL/8z+eUsvfVv
	 LWDJWh1sSGxFoNVlKyCeRaqqKfBYNSwNwMFGPHwH/J6QbdCUEOaya/vJRFkIMVIVgJJUD
	 HyunHNPZbMCWjMcp/AqS1kNdhVYjJ/SeyhYUScHxE46Iyopi6AwYyZ02TcwSN71coUgMM
	 GV205/AEANFpCcHFxN5bzDGlTuoCtLS0l+2vaTV1SGAxoaZq3jraU7EteNePHqOMbS4pR
	 W/+9k0xluu3J6KpAG6Qf98SrvryebCV9kvPWbLCI1oSr5LXvX1+XYbuFSIg/ddi5i3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
	b=nubnQr3Sv3+YNbdbBj2oFMCoen9P0G2WbqwzUmGvE6vl+hwoZYwq7nwo9lqiFlh+vJyU
	 xxSg06Egl8BYOqH8QvP92kH30NBIvcci+MPueE3y3pcyy7+bzOkDpziXS/rwPN22QvR09
	 hsitleOIdqOKj58LMoW9oOxOhkHw8I1CrzvJZXyX9HVh7tmvQsYyjYWWowz4C3Zq5+a08
	 +CZg96toghAMbcswd5NHyyXSQwmfWaV4p08Oxm8o6BFaedWTR8HIJ7mBDVvzFLkVTCDp8
	 0dwvMExzVGb2/eXiM/VsCuBVgxGGeMFMgjx8Id4Th7dK3QS+lZCDlEXuMMgKVYvVNFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AYkfG/C6";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84B606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD84B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYkfG/C6
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so1099455a91.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786815; x=1796391615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
        b=AYkfG/C6L2RSZDFrxfFu1xldeipnwkONvOye16n2DNK+Xiq7v5uSqj+5O66/ri8sV2
         wWue02vHgQh1WpO+IgEA+mcN1qiKssX6B1W+a/cHu8Ch6tqC7i1MV86W3dU+ifiItSn0
         Yj0C3yx5vHmvYE6x0ssk5RVAgcCcAj0ozh7oGkFz1vCNV0fdJvogA5RmkMEgpDu8ht0L
         +eeLcTvkzFz/5/zGdGtXVkye99pW7ERIQSsk8s7QiFE+bg4areoNku/ai7ZjC0Reh7iH
         yk9A2iOQlGGhp+2iSkeU+WFp5t0cOLcf6RYOdI7P3zO2JhIiGnSmVTHUnl9pxBdVDXTs
         /g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786815; x=1796391615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
        b=vlmSfkfV31UUX7UKA++HKQrcarYBFNQaHPWK1iehl95fpDEUc5dyP9D+R4Te8RkBLu
         G1SsOsuwnKzf8pUhOAa8gltpretvG/Z9CJOAISIIA43PHg+y/tsb3Vz5Sddu5vZ+bbxH
         xsyxI+rwaCL6z2PPX5u32ECBUY5Oi/wKRnPNzbdPPbGUubsJLd7Plw9VIMmOa6m1AJCs
         NtZ4j5xxfvS5qDr3nVov6Xn7KwblPicj/PmvqbmBSlqiaMiEViOE3MNykbdtzhuVHByb
         fqDDm7Z2e0vNuRW3AtM4WA3dSKKQThZocaS1mJpWsJaqfQSUMF3I9/+n9wRszGpSO++r
         KaTw==
X-Forwarded-Encrypted: i=1; AL+hErFnB97pXqH44PpvZ1X0Hk9nBt5Rgm/1PeiQqPi3THEYfjQHfQ9dxmWWCA1i4kVOjzqtCTqu3sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DmuVNgCx6n5sD9KqB475KS4NQD5f+Zo+CXSlElp7RSZ2oaR4F
	XI5xLlZ28odmE0gaJNnRzFJe+5hqFIZaw4tISrAIOaNoSieDqN+C0xDKbu8mcw==
X-Gm-Gg: AZFdTZf32qJhPk4wXo1GYcIL47m9+jJdROhJQgnqB5pOWf4A4jJHO6DXRpN5IPnV7v/
	mOMM9uzCGRDYozSwvPBqHoVtvJqhokfIB5DlvG+S6Uz8QetLVyK0SbrS6u7c6WzaeWM+MhmuaqQ
	cq9fhXnhwtoC6qmcgi8eohSYX2GwoPhrsNP68Z5D8wKmME7g2jmaVbs2zH6t5GUnhfKe5WxP2sN
	UAppUuQp9jebgMXXJpJslcGGYBbTyK4POMwMf4CO4l6ZsySREGKgARb31dCjWtQHX2ws0PUtvo2
	8kcAS146Ho8rfFQXPQw2ahaeoAWWjcA9lnE0QivibNtBnb5aqEmeHuas7ob8OUYBs9H+88vtQsO
	cjSE8qQ0/jXOBMoTRbRqkQFrkRKqgJCLvnyMZci7JqM5cmiDLR2AOKNYkPvjZBs4JUcPMcIlHSz
	Rdg3stdecQQi+AcKHLjydsWzSi1OWXC0gpYZ66zFQ7XSdIGvYodUROR+CPYCmjI8BlvhXWFoXCL
	VnwE4mGypyeyCyqNeOnHJ7+8MgYhjD7bFRWETPT1O7GRuUE0+usyFCRCqshM/F5DH/o6psradFx
	RpZtuM9quPljOy95LC57EwGT1Ct8PhUZ/CGFkOeGhG260jdq2kQG4KasEEXPmVMYwYRP46v+Nmo
	RAMQ/rbc9RYkQHxCTcNoAv7fOc2PoxQo0UAVym8WhTzwKh8qHKVeCC88EfZvC6uTVwhFZ6fswlE
	jEojFOF4lABIUOq3Vq8M7qxTY2zfzjI7GtvFZMryM=
X-Received: by 2002:a17:90b:2e47:b0:3b4:1884:9846 with SMTP id 98e67ed59e1d1-3b41c7e0d55mr21957170a91.6.1795786814843;
        Fri, 27 Nov 2026 05:40:14 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm5241386a91.2.2026.11.27.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:14 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/2] net/nfc: fix skb ownership on data exchange errors
Date: Fri, 27 Nov 2026 21:40:05 +0800
Message-ID: <20261127134005.1762-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <179576491145.3135.10392815197154160858@kernel.org>
References: <20261126063911.353-1-luob87709@gmail.com> <20261126063911.353-2-luob87709@gmail.com> <179576491145.3135.10392815197154160858@kernel.org>
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

Hi,

Thank you for the review. All four findings are valid and will be
addressed in v5:

1. nci_nfcc_loopback_cb() and NCI_DATA_EXCHANGE:
   Agreed. The old nci_nfcc_loopback_cb() defect on nonzero err with a
   NULL skb was reporting NCI_STATUS_OK with a NULL *resp (risking a
   NULL pointer dereference in st_nci_loopback()), plus leaking skb
   when conn_info lookup fails, rather than leaking skb on the normal
   error path. Also agreed that current mainline
   nci_data_exchange_complete() requires NCI_DATA_EXCHANGE to be set
   (which loopback and NCI-HCI send paths do not currently set). In v5
   we update the commit description to accurately state both the NULL
   dereference / !conn_info leak and this mainline gating nuance while
   keeping the callbacks consistent with the data_exchange_cb_t
   contract for stable trees and future fixes.

2. nci_close_device() and stale ndev->rx_data_reassembly:
   Agreed. In v5 we free and clear ndev->rx_data_reassembly after
   flush_workqueue(ndev->rx_wq) on both close paths in
   nci_close_device() (guarded by req_lock and !NCI_UP).

3. nci_core_conn_intf_error_ntf_packet() in target mode:
   Agreed. In v5 we move the ndev->rx_data_reassembly drop outside the
   test_bit(NCI_DATA_EXCHANGE, &ndev->flags) check, matching
   nci_rf_deactivate_ntf_packet().

4. Patch scope, accurate descriptions, and Fixes tags:
   In v5 we split the series cleanly so each bug class has its own
   patch and accurate Fixes tags:
   - Patch 1/5: data_exchange_cb_t contract and callback skb leaks
     (explicitly calling out ST21NFCA success-path leaks and the
     nci_nfcc_loopback_cb() NULL-dereference / !conn_info leak).
   - Patch 2/5: PN533 double-free after queueing resp to dev->resp_q
     (in both pn533_data_exchange_complete() and
     pn533_tm_get_data_complete()).
   - Patch 3/5: Digital DEP missing completion callback on terminal
     errors (hang + socket refcount leak).
   - Patch 4/5: NCI rx_data_reassembly cleanup on data-status errors,
     interface errors (unconditional), timeouts, and device close.
   - Patch 5/5: Preserve signed errno in nci_add_rx_data_frag().

I will respin and post v5 as a new thread shortly.

Best regards,
Bin Luo

pw-bot: cr
