Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525193;
	b=NgmRzVXAKXzfKMEUHIj/NwNkyyuvZoeQTZw6xiZFhLMUwYnCKYXJTFcAOarM0KqaJBeP
	 nHxc/ANYA96dtW6oJUFZBHKXMgkDLwM1EUFPGTuyQvN3riUmgTtiQQDbjjt/WeObGRmpz
	 cLCv7InJUixVfOKB7L+F3XLITlE9PW8W0ikDlx7kwkE5YyVFsHf/DHqbt2/CvVngRocbn
	 dtoypP1hOCk7R6RZhkV4hfrrzBqyOMbLuRe97D21JjxoUpCppSlsHYFMibrKtPHBSoEqh
	 4jwsFjSliczFvK0+SnMSuGZVU7OVUTnJHG3MrSJgyVQCvbKGEAsNZob/sH19sM21X0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ZNMQYhmju9mqmOBv9DnhF24mCpMaPrR4UGJt4DmlksQ=;
	b=ocOJJWJBqTR5NdjqAN7JS6f7ri3dnoH7894839Aijl0qwelkuw78hhBgjuPF0zuTHdO+
	 ttmxM7y05g/x6hlYY+9CBeoFGx4vOl4YGWoDxHiIpuSsDjZGdEfhi3XCW0VhtaFgyPl+w
	 XHK0y23FQsAEbCUKu2cOL/Cn2NWuKZaojZ50H/DUYwmFp/qfOqswMLd0ZN39HNnOM+WAv
	 xwKxJwSPomqalVXkuL7UlK7AXeR/Eck1UxZSf/WbVLiN1wWgLRLnFKXSXmcgz77yoR7YR
	 Cgj+o1+gt8uH1nWIjRLT2WtgNEC7LoouneoCfpIjMv3NUVtMuI271U0Lgkai+ZrfMpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="hiMy/ghi";
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31295606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31295606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hiMy/ghi
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53644b28706so75285451cf.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795525192; x=1796129992; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNMQYhmju9mqmOBv9DnhF24mCpMaPrR4UGJt4DmlksQ=;
        b=hiMy/ghiDM4b7ovoy+0Vn77oiyDHFAWvplcvAoT9c5Bp+SZGFd70KgjQmeX3O+6D/H
         8Z/kk8JL67ig1R4KaAncZLGOqNqOV4AZm4MlrJi4m60CyVcnFQL1NhdxgOz3vebtEiiv
         pFcblJcTuxW15Vksp9sDj0nvFx7ojVnkjlKrFFVUXhshCp9HoCo7OHxaat93LJ7lSyyZ
         jBKVoZfSSjTFYGO2eBI/YlfiHl0Ku6cf1QYEVk4HJ79gXTTCDD1pErmMU2Yj+U0YjBpA
         0V4vbm4++wCpTCgcmuM5fAQ0O3ARdRzBRsUsoNz3dkh72Qejgo7Vo/vaxhtjeqM0Q2fr
         ehyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525192; x=1796129992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZNMQYhmju9mqmOBv9DnhF24mCpMaPrR4UGJt4DmlksQ=;
        b=G0f+M7/f7MEsyq/WIStUi3S1OFvold31UslM5s37oG4+bM6PATVYN4PAllcpyUO622
         Q0Zte9tQ+mtH927Z7hPBWq4uNDtbOwd79jpdp1+Dr4EDbQdDCOggZHzkeU3HBgWHUf3c
         L+XiQRfwZHH8wkHTGSpqMhUXN/fCIXr5i1VwyvvZhZ4tKfouIvMn03jWv8pXCnFWTNSM
         +6d4XNjK5hM31sw8KmpunZbVBgoxKFFLwMZtGMzIF5nx0XoDS7KQmozQmAQVivqQOPRt
         fdSNQVUODAzqePhFL+GQy7XeQd3LI0L4U7WNogAIBIPOJvb6UgJtdLaBx0+8vCEM/o30
         PXlQ==
X-Forwarded-Encrypted: i=1; AL+hErGmCpB+d2Vplhj2rZOMbUrFbFwumB2MxMIJbgDA/Ku1NwdP7jb9bGImbfY6YzUICLLUwR5fv04=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A5+fpmJKPqysGI7MXELSkZG5KSngbbw93pUuXXvfhCjBiNuv7
	eOhLYaj1ox65XB17eCReGf8U7qcJW+mjNKmwh21I/rSuaolKFjNxdQLK4zNFKrfCSXU=
X-Gm-Gg: AZFdTZflEmPrhPskNCibV3uS1Cf/g8u0CQEoNgtSxrFvfmf994L8BupPe6pPxSpAct/
	XpTR4HitLXPOeRuzL4xANBXQaIjgDv98YALppabxDQnPCdebdMhvtMg2440kJZw0dLCRPHbTZBU
	Ncc9ia5afb1/UNl5aEFkXbWUlsE4IPrsqz2syMwTqmNvqjckHZ2d89m6UlgHC5U6zTxYE/it7vg
	ufW7kZBTktzezwvxBulg357T+KiNsCHL1dobS4fox2/fgvtxPwtQFUHchFSO14RkGWIClMdj3/w
	EqEqv8JZeuACI5Phztvd0lLlXzrEvGWCt7/Pc7g62kvE5YzZrSODNDJnsTuaEh3f3duvw3hePC/
	XRAXtOWzIF6IXrwFLK+WNlEA4hAJbvEUdS/i7hZshrSdkxMTKGG7Ju/yPZOws7csD1J5Qh/Pod0
	GIE8EqzSB1B873WcElinuCXEAXw2inhSssT8e8/AN9uGynzOW9Kahaz0J2nJUjCRjRY4rv41NzQ
	F+85jaCS4SWQqiaHeowpUdh/pne3M4OHcbybRYapV3Xh08f/UZkIBTTwvdEzwqTHwNA6aRxmjDG
	yLPAVmq+NhDmNQYtD6QV3SAHKW0=
X-Received: by 2002:a05:622a:a0a:b0:536:691f:b7a7 with SMTP id d75a77b69052e-55d76a1f9c3mr267446301cf.29.1795525191976;
        Tue, 24 Nov 2026 04:59:51 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78811fd5sm127268421cf.8.2026.11.24.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:59:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVq7i-00000000Nz6-18ee;
	Tue, 24 Nov 2026 08:59:50 -0400
Date: Tue, 24 Nov 2026 08:59:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	dtatulea@nvidia.com, moshe@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V2 rdma-next 21/21] RDMA/core: Report and enforce
 adversarial mode via GET_CONTEXT
Message-ID: <20261124125950.GC9566@ziepe.ca>
References: <20261117170914.27410-1-yishaih@nvidia.com>
 <20261117170914.27410-22-yishaih@nvidia.com>
 <20261122073156.GA12665@unreal>
 <761ca80e-a772-41f3-b8e9-cc332e4ba5d9@nvidia.com>
 <20261124125327.GR14811@unreal>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124125327.GR14811@unreal>

> > RDMA/core: Report and enforce adversarial mode via GET_CONTEXT
> > 
> > In adversarial mode the NIC is not trusted. As the kernel protects its
> > own code from it, user space has to protect its own area, e.g. the data
> > path that polls CQEs directly from the HW.
> > 
> > Hardened user space might use a different data path, with extra checks,
> > and support a smaller surface. This isn't needed for a trusted NIC, so user
> > space must know when a device is in adversarial mode.
> 
> This information is part of trust level series. Why is this a “must” in RDMA UAPI? 

Userspace has to work differently if the kernel driver is in the
adversarial mode, and the kernel should not permit an old non-supporting
rdma-core from loading to prevent a security downgrade.

So it has to be in the GET_CONTEXT handshake to do all of this.

Jason
