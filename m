Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674645;
	b=y5fovnK9rnYZHIMqBgZRVYKMmbkWK4Zvl6wV0o4crSSojVbqK9y5Z+Ja6qKD5beP9U9Y
	 s7xkIJOI/o2BX4UUBniIw16dh/XVvhQL6EgO1dqd59XGLwhsYNrGurQdjh5nGapYYeGvb
	 vCruGMsvx+AHwf+sGjaJFLnp7qT5mtnVOKaUVncCpz0GqcUzNeZ5O6RsjjmW2kH/FMZT7
	 ukNA1SXIgCsDh14rNcUQhpkJVxAEFBTePm+4rL4dgTrP5RAVPqRNX0G4KkmizgyZkX78s
	 0d6jUuLKxtc5JkdbYB+ILH5oLQXnY04cf1EUncla6sC+Vf/njNPRTDPFfM185ZDvmJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xLaMcxqQNYufwDCWdQa+5IyySVLmYA+rfdxluloXat8=;
	b=O912pEH9TBMRsMLXBxmHkUNIm2jhKgkkctBurFYbZxzkZB//gbu/weu3s+QjDRTS2iAK
	 7XaWEPIAfEgkdblOkAbIqxt9d0pXWKdfJ3nlth6WWedpPlEUQRbyL7F6a/X5hqWDasHrh
	 +BMlxy17Io0iymdRC3Zccyp2TLAjFT9D58pLf6ll7q47R6N/cxNUjFF2kFEyuhcSsos6l
	 5iMoGDYU+QGbI66q7U3dFbgg/HhGvpNoaEPNbCU6fAdxXMfSgTzuK8b4WnQ3FpIA1Vwnf
	 hAI2Mfjemzx373iC4c3yWP6ih9JxlEAv4VUr+1/hjqkASEJpZ23py9hY9qFkfQLQIpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ozyrUyIc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDF606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DDF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ozyrUyIc
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1517779c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674643; cv=none;
        d=google.com; s=arc-20260327;
        b=ktR+kDdRcvuP6GvKx9/14zwRXXuGluTGzoV1um3ITPNtNnvtCcoKoziWejwfsFRbyt
         OUe0VLstsfeaDDNDuth+QVwbGIa4arysF1FcNyevzCO9v1jVKBUxewnBJdMvr3T2klYM
         Q8qqQxdHtjh9egKUCiDcb3C/nO6DhsIyw/sQSgNlUNa1vS7flTKFVPvsV68eWMrvGB0O
         cubVxW1OYEAjp5LtoYfdBKZPStiRpYaeWkLVPm0AMD3d3Di7Mbql6x+2wS7mNP1dPDJu
         FuJrx1n5jGEICJXDqzoEcKJrh5ssnTZOfGy36Xv/VDaC0Q95BPsLLpoB9Z/T2O2Ojrpv
         8Rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xLaMcxqQNYufwDCWdQa+5IyySVLmYA+rfdxluloXat8=;
        fh=2TUxUMO55LdYNE0OQ14di+TJcS30ZIbMUBQMFhSNYfg=;
        b=ZSY9P/jnf6kzP7J/B8ANMzfNGe4DhKV4zteywHQRSg76Q5iKs61gXduTrwpy1jY4Xy
         1JceLbcjqjjsiIO4+TAREZmgMDjHdZKfV/Ue8Jrm3Y4MMMVAdvAn2STIiXR6By1PK+1U
         E8ADS6Yi1/KR9VNbzV1BzFA8KLu9tUZ2dkWg4Z579a8/4vOe0yKhhOw85Y65eC1v1VaG
         MtkcW462N1Edt/+isOQPuypqeDqrXq+tqJls9w+sfaTBo5mqBn6+d5tu/h7UoP+OzY9n
         1enZyl2P4GD8rHM9IzXOhBg1bxGOf+TIwfAXI3svxD5v3LQeovmLteqh218Ex4TYqzw0
         3MIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674643; x=1795279443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLaMcxqQNYufwDCWdQa+5IyySVLmYA+rfdxluloXat8=;
        b=ozyrUyIczF+0yPe1byPBNXFy7ZZfLL2KupSGUB1DoFHO3mHW/cjuDujcFaBlq81+HT
         Vc3nZmBFYAgONdFn+HjvWUBARZ/2Jk4hnH96U3L/p8fGxw8Bq7tO1ikO2eRZ+LnsWn5B
         vI78MfIoxJ3E4mYuZyFulLmLHL40ndB3wkpZXdlaew/gjTvv2pD0AlmpoZl319Oz7Tn8
         QJPqM2rCbwB6zr39WIeBhUoaSTjmWRV/6OGHJBQgmn1nzodHsp7Qax02ZJrbsc2wyP5+
         I5H6QiLJCJDLaFyPqkqMajXFjG3LoYhGgZ8uJCWbsKsUklFPGUw8cU60RL+S3/JFavAV
         5Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674643; x=1795279443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLaMcxqQNYufwDCWdQa+5IyySVLmYA+rfdxluloXat8=;
        b=O3v87PnGhqY7PBvSyhJqQPqLKC4SFaBBA9wVMqijCQiRvZGQKOtvlh0abRDGt5AoJg
         R9fcQUhBNL3022r6n4C2UqDJm+8Oo2RE/3HVORDkqQglAtvVVWNKuGKQv0YrgjnjYCRX
         qZ4wQPXFy4T0+wffW3wksg/66koQ9BTqA1l5Jm0EoN2CbSLBJiwVi5jl399vKD7bAQby
         DwH+qsAMQYvqk0TdAEA/Vfuc2qcbbs+SpxN6A+3v00h+8I+6LouXjfYAfGM+T8ECwAB1
         2Dkr8sLBePx9ONrsXDFI8mMArqhxskvedJGJGjOZLwGtoSws09ESmhR8FuKDk2sASgpD
         JqfA==
X-Forwarded-Encrypted: i=1; AL+hErE08W2rFz9+obvE8gI/n/EayXV8L2hY+BoRiCD9MI7eWDQgcA/a2g3WcFyZadJr6Is9dZNEWPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dd8RB21iOV+kvIu3MTUfpE5e5eaC80I2E31JpEiHy9fKO93NX
	8Zaw3v3D3BdtKRwhL1aJ5wNmKVz3HTdu1+3q4B3O/9dZdFp/LEXFwZPuqSpDce3DZwrq1p6TQPx
	2LJuT3lHRHDPdUx7yS/9mr2sOGtPH/t00Le9O4LUX
X-Gm-Gg: AYBFou1SK0lPbkUE+gWYgtRCoczpsdz7KhHBV5HKSm3d05JwKkVNSw6UCl0JthSfTar
	IpWAWkdJmBnlOpttS5sRC8hCCssx51UYTldKiG5absNJRwwN0U834f6US/yhFYvRnIOnrFsxYFh
	6TH9X0EB0CFdv03Na6SmcnBbMlQHQYj/k9D5fOY1QRaTdSH5IVZXMHiumLYwGvX4r8+dd/i+x+2
	nw3MxefO4Wrmpu8oXmPrFHnS7uBNb02elWOvaqj2XJDOQRsYZD6MJX9exs/kwLgaNctAcKfOpKC
	YPMSwb8KOUn/6YIeUQRUI/ZI+auPE+JdmkR4xr4HKawO/qawKVSvIGqgF+2Jw6bDhrkZMKq047i
	zJ+rM9fIjoYKTREWA0+gBUUKU7CDBG8DL5l3+rEmcn9KMQx/Z6gq3LqFM6UOqIMBLTCjxgnJCgZ
	w5sfYwz1DjedoP64xy9Uj5XDLuhTLAaYzua4rB4PzWCsIijwKU/OI8vx7Ke7jGRyjnnY3obYIDk
	8OMsTTgxYY=
X-Received: by 2002:a05:701a:8459:20b0:1b5:1a15:5d18 with SMTP id
 a92af1059eb24-1b51a155deemr2258428c88.14.1794674641044; Sat, 14 Nov 2026
 08:44:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261114155150.235743-5-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-5-edumazet@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:43:50 -0800
X-Gm-Features: AclHuK_1-hmqdZaE1iDLVB-h7xGwKPNrptnI3BZ8asZu7J-hXGNZW2Iq3GjJmOM
Message-ID: <CAAVpQUB8tmvOXJYm4udG=3XtZGHNUL62Bd2HgeUZGufu7imXxw@mail.gmail.com>
Subject: Re: [PATCH net-next 4/5] net: add SKB_DROP_REASON_MEMCG
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:52=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> __sk_mem_raise_allocated() fails either because the memory cgroup charge
> failed, or because protocol memory limits are reached, but callers can
> not tell the difference, and TCP reports SKB_DROP_REASON_PROTO_MEM
> in both cases.
>
> Add __sk_mem_raise_allocated_reason(), __sk_mem_schedule_reason() and
> sk_rmem_schedule_reason() returning SKB_NOT_DROPPED_YET on success,
> SKB_DROP_REASON_MEMCG when the memcg charge failed, or
> SKB_DROP_REASON_PROTO_MEM otherwise. Existing helpers become wrappers,
> other callers are unchanged.
>
> Use sk_rmem_schedule_reason() in tcp_try_rmem_schedule().
>
> Note that memcg charges done from softirq use GFP_ATOMIC and are
> forced over the limit, so on the receive path this reason is only seen
> for packets processed in process context, like the socket backlog.
>
> Tested with a receiver in a memory cgroup doing small reads while a
> peer sends at full speed: kfree_skb tracepoint reports MEMCG drops.
>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
