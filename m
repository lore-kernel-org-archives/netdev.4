Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637097;
	b=4vxVNRfU30omgT0tg8VIEEEYWi7NFdJCRCqSafSqnJtU+rz4asfGQsnwkXlowIOVWCl3
	 ro0ras3CQWmq6NCkG2f99BINms0+4JLoMdAhm1JiXeXj4kKgVoGNBrh9jFP/bc4RJZhn9
	 0sYjPyrkLQot2V9CtH5oAqm5NtFqn58KlSutYF8/e1H/2zJcfXE8JpXYWSgKx4keaEdlL
	 +VRSqVvCJeCdcOm2CfveD4MgIWv/ldLQPabeRJOquP3T7OLMTB7cvH5QkYHGEv+bi19Ug
	 MDKnwZ/RiKw08BKw0MWfmu7up/zPz3wBkJ3QQ5Xyq/fZHOOeRoNzkINbGcBKAmRWlog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
	b=YD08af6Aom8SNmvMgfBRWcPQWAMFLaS76IQoZw3MUugkBJ0EhmPvkrfmJ+yXJUw6g5D0
	 xm8ZEhi/EpTrzDgjnzHkrxSzjTPFbdP9pN5xPAephzLSyO11kRseAFZ+OgAbeNYZN6hME
	 xVlmSvdAw7xSVsGygYCZuuQt3jvfI8hNa9SJu0nnNcXSO7MDUcslNFrGPkiPUvf67bPkm
	 uLP6TPzjSlDFf5hpOyetkle5OFhf62iwdgsXMF+VvLJqzKK9vmsI2cuoSbmdKzBLjWar4
	 7ym4YUj/xxk7ibeouodMXPAoK5KWbiPtCcJ6eo4z0QWeQ4SQBnCMGZL4WMw2Rn7c1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVz6fr1k;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C0606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVz6fr1k
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9501034c4so27016315ad.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 22:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637096; x=1795241896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=FVz6fr1kxfdVb35gJO5L96Wa3vtaVQ9zIvc2uJMBrnaVvF1Lf0t1L9iCiP+RtzYgBD
         jtrB++6aFlAwb0EN0XaqRh54dmi9e/M9Bn0BEuCBHpl6KUexIVdS4tiMous4XwdXXMc5
         yiYrzoeGGBNq7Xb2CvQpGJbgeeNJwh0AdwVYzDAs3xuhb6ID1VNpv/2As7OUaMD1a3RF
         zkWB9ET6lTFx2oX+7eFT0PPShXB7VXxu84e98alSc5rTPwFdemgFZoGrSAikJDbc6qKS
         LMoh7dy/fiSzqdUa9EI0dNzMwmLSRn6UYOiLpXi0lvTjBdyEqXqOQbz0U76aNsL6qacU
         SNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637096; x=1795241896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=ZxvLJKcApN7x/bhLVZJYwJxztGjD95cnhyYKGinzEUXlafKcLCrgZpxRDqpe52pihP
         iAtTMJXW/EylLN5JLH83jmTY+xzpFGzcHkNrM3iomZiRgQlza/bsB1jepr2l0t2IbZsr
         1O7Sv0cFboXTORAhyhj+Xfvb+Byv+tVD5SAvBRnn83F2AFHNFmJRp89fONUqc2FBgdGH
         +IypW5U79/0k5eNxaNF5glEP21k7k/WM2Fr6xC7zJEybb1yrmgbJWLxpSwDf++pGh60c
         Wtgw00kfbcRZbkZMt1fRIZiMqKioB89/TE4B41AyhMyZN8TWlFsSzdOYYQ6Zpdl+apP0
         46GA==
X-Forwarded-Encrypted: i=1; AL+hErETqKex/L0csqNcN59bYo/aaSBfKtYcr3oM3/UGiy/JJ+oc/hgDzU47cXlviLUnHCAa5oWr6kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sh6AK+8b8oaZQf4LHJFbVTSb/zrh9ZdGFXWj/CKSFKFoLS/sA
	oBOkbWcqIjmFd//WXVu2FVu/Vzg3UJ2cOhSwZFkX6Tn2mmuQG7/Cjkw7TUKqBFb251L5MYd4eZH
	tZdGyRQ==
X-Received: from plww2.prod.google.com ([2002:a17:902:d102:b0:2e9:b079:3771])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230b:b0:2ea:e084:332a
 with SMTP id d9443c01a7336-2ee0dee824cmr51445225ad.56.1794637096336; Fri, 13
 Nov 2026 22:18:16 -0800 (PST)
Date: Sat, 14 Nov 2026 06:18:15 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
Message-ID: <avf9HomOtgXYiRLX@google.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:57 +0800, Yongjian Wang wrote:
> Black hole detection (net.ipv4.tcp_mtu_probing=1) has no selftest
> coverage.
> 
> Add a test that only sets tcp_mtu_probing=1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
> 
> Add a shorter variant with tcp_retries1=1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

