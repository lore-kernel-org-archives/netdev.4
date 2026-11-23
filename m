Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433991;
	b=rMVPqe+J4JyKJPvfXaUIUItH4Of2r7P4FrznRNLCNJ7kS/bJVQqLEnrE5Q9NiODl4Xjv
	 tDj6Acc6FHIEmAVC98Sx/oMXo+/tsLunNxK+QID9eXwySQo37uXWuI2EQMWTExKUbl5tD
	 ore9oc3hI+/z6RZ9YptBP53EgGPW34SvwftyLHDOzoaKCxUOejPSY/XUcS931/Bc7j+6C
	 s8EpDcDtleQ2HvLGaqkCT/UJlK7TnZYsm/drcynqQi1E3immxXkDK1wG27aUERp+mkSoq
	 oIYroB/+GFS7ZTultqaa5/RnjF9d1jjqjfysUEoU+Z+g1ZXHXLb1dcHXoPFBfQTGjpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YF4Gn+K4JXcV+No8s1/M+pUtOUffRl255hz7KzhwJoM=;
	b=YFVFfi1fh7E286aGH2ZuES6iypkzj38xSTaoAvpKTGehFzqMTc/RSCNiX6cwGgpamCzo
	 4aticqLEKkXQpfjhSps0n7o7qAUkNg3Dz0WvcNyB9oP68zDTNVbd/Q/reJcJ5CbRlAz6Z
	 gkeCzcgPgEmcamhqXzXryOmED8T1CT88zFdv2DVbahoIF2AzzNYdx+HJqhFn7tl19T5nm
	 NciRasTSBi9FJ3A2q3U851ubk7B3bkzV5/QBHoZS0Lo8OymqiIjPFEa1KBF/yMErWg6rl
	 RkDhDxD7QaZ+/z9EOwRx2YOqDAZ+5PikjGd5UK/NDS53g1vJn00qpq4THwZYroeGQQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YmysGroZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F8606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YmysGroZ
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c7445cf85so342761cf.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795433990; cv=none;
        d=google.com; s=arc-20260327;
        b=n2E5VK8hTpbEdCQh49nDlf7jyY96ysaC+t6JWFI9T6AEQ366R5oNwAeocdvo1ZA3D0
         T34RCXEEF6hsF+jGl+NskK2md2x1A+ShKMsh8yiHt8VJDGYj9CaqmpwWdh01CeQhqK3r
         N4WRokimGmL9tEI6afZpYjuSErTKXG9ObYl+bLJ8Dk5NDBK8rvXQENNR/b1JC6cht2DP
         HIBrLOHs0UYCmoctzZbqmb4IdbssXMK1lqutLG7q6uciyyqTFex6b7/SMZ1DN+TINUEf
         WC0UEiu8mOoZvG4Jk1WpdTw4hVifYS6wTnUHfZ1+kCr/+mBn1zNtZ9yhmaOvdkTuMe9m
         xaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YF4Gn+K4JXcV+No8s1/M+pUtOUffRl255hz7KzhwJoM=;
        fh=YmKvVO5e3RKvdNNy2jtgfV9knmUAg7CMf46vXpg8bjs=;
        b=OTCSpkiy74PEke8mNhnwaEopI+0L7kGigximxz1AvUGzK7hkKAPVYC4/1kiMsrjFUL
         JXTaFEycufuKaPRgv3HBjpmUWH+++KXYXxtiGcvlAhBHUdAlps4gAAe/8Ercb81zN3AZ
         Y2k1+1IuunLKhgxCiUHbzG92lVhL3RE4oUtEdedYEOgecAHfWsEdnc+Dt5n09YELjBIN
         uncwmU0YFT5QRndZf4UDuT2Ez95uC52OHE3awmhf+smT+GiVtmIPmkxrJW648pKR7O8N
         EfzlZjsp4YYZb5NyQ1QDDO5+O9l1fLbtcmVO/NoBqmDX6ej+T2pUElncebFGgCJoML4K
         VNaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795433990; x=1796038790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YF4Gn+K4JXcV+No8s1/M+pUtOUffRl255hz7KzhwJoM=;
        b=YmysGroZeaxhlavzvQOJcoKKO4sCvGEBUxUb9f08GsZZofXhkgCVbLb8anWQV2x4iJ
         64Rs9sCS4G7GFN4aljN5VGv52+IfuwS5aVvL3QnU4EBHfk6ZBElof3ZfcE4y6Cg2eMw1
         riQgGcgnEKyc3LPwMTu9H14jk+HMSSX7TWp9oMPSOipjZeDlNlPgl1pxGV4rhvtfS1y7
         GBR+oSPBLygGeTB00JgvzUBjbMkJ1C/5icfaRu5vf+FQlOeob1MxvvLY02UeAgxlEMU9
         1F43CV4M+Mra2dqpsFS4kKRKzAhFjjcNsHWt176OMXiiH4h6tnoqLQhutCRjcyEsh3nl
         tmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433990; x=1796038790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YF4Gn+K4JXcV+No8s1/M+pUtOUffRl255hz7KzhwJoM=;
        b=HOdL9jX5og/3dd/538eu0EpXkigPMLByzHw+C3moE5ij1vDAUgX077WyF5wcwZYE4v
         Ukq8mqYN1Eja5QSWS+iONi+xFXvEHK8pik9bFrp+jM8Tj4nv+CkWSYPM1VIE76c1bw87
         y/aBr4110wK7TO9Ij6fexKl1e/x64pSVVAwQcBY5SWr4vLjO2xwPqieRB146v+KMREJI
         w1ldqs8bMqA6fiHbiHPfiOcBrVIEY1iebbBZNuywqcyKYr55cE7fuZamMzrdKgK3fg0X
         j4PA6dMQmga7wUsFIr1MSI1uHktf/YKEy5Nfx5csTvX0fAtE5Ue1+iD9XcobPZp/glTi
         bL+g==
X-Forwarded-Encrypted: i=1; AL+hErFnpw5+4Ti50sdRZBUg09oKU5FTJ8KR1NshB/hs6rkrIRJB6QgeEE/vDZw2SsdzkayokHeA6Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpOyhpHYzGE9ik28dALQfGhWkyLvKvVOcPLR5dWvEW28npyAV
	NbC/2TbqUr9Hr7lVSetmGrosz8ngObTX1KqP53/QmcKAGcmpSsS/Izzk+w7YkSFcCDFaSrlgNMn
	i6dCf3yZj20XaBV84MlcNinBIJ+PwG1ZbqSreaDtKmhfpzKBja9nCMFD+
X-Gm-Gg: AZFdTZf+zNyU8MI34USFshjnIY7db8MKMki1ykaDmVYt3CIgbLc+eyDsHPoOBAMwb18
	BY3YHCMVkaGul/TQl2XtnVMMb1fwv3drfiMQGNfDKfKvQSe/YE0JD663W2Dq1hT0ksb6q/N+ENE
	bVgXrbaim1yaaeEJC7yq5CX+ZsKWa4bF7e/39GbDkBrT1fmpQus9JFWuRyBKDsxwzFEzkZIBYwZ
	hUKfikQ4BGkBlNyFXpkVjN9R4aizi1JRVvvvef4ZuNA9j7HzCfcmpb4lYy8MFuYucKmfGedpdLC
	DZ3Z9fcE0p6SUogCLidjsDXMwuynITZNV/QSr5mNPsFCqeITQPYoXD5eZprnOKX+7zORWPRs2ge
	zfN08d102n7USD/xB4MXaXFMLvrUjrHBhV3YUDj+IBmcy5D67eTQTD5MeqIgDH4ewsKWoGA01L8
	iQuYPp9451yHQCsx58uf7kpMMGS3I=
X-Received: by 2002:ac8:6542:0:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55d88fffc05mr32127571cf.9.1795433989168; Mon, 23 Nov 2026
 03:39:49 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122002633.584362-1-yuyanghuang@google.com> <77c1afb5-3a1b-419c-a36d-660c464ad307@6wind.com>
In-Reply-To: <77c1afb5-3a1b-419c-a36d-660c464ad307@6wind.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Mon, 23 Nov 2026 20:39:12 +0900
X-Gm-Features: Aa3M54rpPJ_96FLLvtceDA9--A1VEupxDqUqTHdNkJ4QhM__rCM0as27myH5qNI
Message-ID: <CADXeF1Gvs6bLZQC6FJfRX10+4zy4cmpQsOCLBoHiz6Euz+XRqw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org, 
	Henry Martin <bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

>Henry already starts a thread on this:
>https://lore.kernel.org/netdev/20261119040153.158372-1-bsdhenrymartin@gmail.com/

>He will probably send a v3.

Sorry, I wasn't realized that, this change can be abandon.
