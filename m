Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022631;
	b=ulfkiXYCXkPe5kVlBxh3QBapZQd4YnZcq9pPvLFIUSD1iTiQlB0J9tmSn33JORAXxY9O
	 mkDPgZvbx2Gq89k75JxkAMQSFCzoyHyXHG7Jzmg3Jn0cwId3cGOSGSGuO9RqcuboBb4JS
	 8YJv+fySchki1g52xgwI5l5jhCD1j3ABea/YY/AuVVA5xk785iFhJR51QHuBUBgDVXdTe
	 iusrAEsbY+Hf9j7qz6NpIKxveGKqJ9cKRzhQaHp/Uok07AXaNdlMEFeysP2lDK9Af5ZOv
	 aui1OIxlsmTQ1DklNia2/SsAiKm9CXXcljTDYExmd3JFoT7w5GkYrccSeq3bX4hVlrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
	b=TQvKvavV75FFwItiCjeK6peOgfShVTJIfF0EcVPU3duq6MaP+baGUSGNf1dRWTxtr50k
	 kt4xMAZ0KzdNnqgdT7PjaavTQS/3420RjVM1ssw4d4JDhU0EvpvZjCq5LZYrflPX2Mgmy
	 kkqnm65CvXporVyTngNgYngTEfn+WU1XDqUmm+FdC6SDnNS7ElB+16kXAKUGAuorrPg0Q
	 SZy+HAY3LIdpGLGhZxHwWBU2jICSU0EjMy/Iuiadhi/OmssR1yqE4Z1QzXGn6pAYZNFWK
	 /DuESK18MtfaZuK/WjI1soBra/L+ujKKEE9Fh8gnyvQd7GEziLosOR3cn0E9iTveWbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P8GBKFBn;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07FC606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P8GBKFBn
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efdbab4e03so6149365ad.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795022630; x=1795627430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
        b=P8GBKFBnxmbf7V68kasovYl9I0n/ZGd1aS9Njk65BYYJhARsPzq69e7u1izq/e8eKt
         J7vaKiTNq6CIuuLohAY7n7DgAsuleyULqYtQMutZzDihW1mO/1GT56Vfj9nOjCnUuBqK
         JyfQK/kjgwaj20rJFlHmhpSdu0j6gRtKSJjb8F+H2Lc0dccIsyHSMQxBW0TADuvwb17p
         28PxRK7LzbN6xlBGDbxwRckImC5zR8Ogeo6VjCqnLPnpFW9Tm+MKyzDv8QNVC4pky8wo
         4iIfm0Mzw8yqFxMV+WHzIY21YN87TzzizlA3oCUiMFMJe00IGFWoqGwxYVzS6p7ctUM/
         UScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022630; x=1795627430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
        b=FnSMXCemEr7U4oLtSMBH3ULuWO6qUIUoaZqGlYdX7IF2Q/39nX5DO4f5msyImrsv3M
         VFYmJ9vh8+ICVNrOrsimSDLUriLGdjw401pRQOkHosgwvaFu3RaJUzR97oihbY2iJdR4
         HzK1SoNYEzu/XyxNdJqW1o97/l29SQbDthSFdC06hTPeN738wz44Ftv0p9GqUbDzlUoI
         ryZqaSCAqtEI89KBrmrJaeONlA8nai6piqBe+8KkMwqIbERlZq6goymWfVcn6dGU41mB
         ygTdMhuc3YQWIzbhhV0iaSs8XFmb5vor7gJu4w+QXvM5Iy69FsrEahtjFY1ekR46hIAc
         hu7Q==
X-Forwarded-Encrypted: i=1; AL+hErGIiE3Gomny9zPbp+1olUYCQtTe0U81T5UmA64wPjfgekI5xaxKM8WbTUfE6Lf7beMoCp6mKKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KysyIuvEMRtaABafYy+FvLBeI2eKYb8alywxfffhSUh2N25dO
	sldOgmb9PVxmbnmrXHq3zdP+U9OTaKRC/aanSuxf+7V1bXDh4rJTr/Oepj4mTkS19cU=
X-Gm-Gg: AZFdTZcnbyO7mBDQ+ifahnRFYgtmX86T5IctjnYOSqnm2Gdhhm/2e4n0GNhWs2ZWMbT
	w84XRNGd/NSqGHudMIINhlndpqCLo9EolfRkuXRuUvzrql5Wq8GbpQtlvc4jrp2WzXfQOjdnmxR
	kSzhfEGpktdZXy1f2MpxYVTWA8W8BkjbGSwMeNcQIlhl87XamT8bg0JHIvS0j+TeatlEKCJUOYd
	GQoK5xwmeIjvxzkmb6bzIPh8T9a3DFPyUFfrJIpjzqb49i1W1xQCkSPvmDqD3+h0FhBAOy1pCJB
	LZKPaecllIrn8oXdMvTVf/kzNvyjTTZq1KAvw2c3JXasFqP54OBsRSoHuy8SPe/1u7tQ19zONdj
	kyPWs1gMiaoS/CnE1bLZQcZxv2C9gjb04GduMklqtkPEANt992rjS093WbyGDs1SXmePlDYtuUg
	i7Wf6QwwOp/80eXjC5nXywNX04oKaOmvwQ/u+xjY7NliMn+P4ZR85A0plNdL88Dl+PqeDdQBjKJ
	4Pg7mrAysinRoyIdDsnvY9MeJWYCQLvNNHiVN/iavTayJhLtFpSjp0fvutugYqNy5+uCifcbN1F
	320v32fAGFuItUrO7uTwhqfuURbrl1jIlfsHkMqgtE2Q
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr31348375ad.28.1795022629991;
        Wed, 18 Nov 2026 09:23:49 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162c2sm17277315ad.12.2026.11.18.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:23:49 -0800 (PST)
Date: Wed, 18 Nov 2026 09:23:48 -0800
From: Joe Damato <joe@dama.to>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe
 failures
Message-ID: <av3fJLQd8P+XlOS/@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Changyul Lee <lcy8047@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261118050716.3873167-1-lcy8047@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118050716.3873167-1-lcy8047@gmail.com>

On Wed, Nov 18, 2026 at 12:07:16AM -0500, Changyul Lee wrote:
> bnxt_init_one() allocates the auxiliary device ID and initializes the
> auxiliary devices before bnxt_set_dflt_rings(). If that call,
> bnxt_init_int_mode() or the bnxt_pf_wq allocation fails, probe jumps to
> init_err_pci_clean, which does not uninitialize the devices or free the
> ID. Only init_err_cleanup does. The devices are never released, so their
> aux_priv, edev and ulp_tbl allocations and the ID in bnxt_aux_dev_ids are
> leaked once free_netdev() frees bp. A VF probed while the PF is down
> fails this way each time.
> 
> Add an init_err_auxdev label for this cleanup and use it for every
> failure after the devices are initialized. On the register_netdev()
> failure path the cleanup now runs after bnxt_clear_int_mode(), in the
> reverse order of setup.
> 
> Fixes: 2e4592dc9bee ("bnxt_en: Change MSIX/NQs allocation policy")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus BNXT and W=1.
> 
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
