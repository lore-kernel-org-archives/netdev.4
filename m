Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684979;
	b=mCKcXW+u34TUd+t4UaygqWH/wDFkczwhIzkRRp7uu98YKtCE5cC8D2wGaYKesVWnUKzF
	 VwUWXlxKL7nGoeg82e7FTt5TgRcCwiiMmPIGSOjBlczWDCnABs132zL/iAcG3X/RlQz31
	 ZWo0/K29hHi7kn96e6DxK8e+aEcDPLFfSPuvh/I2tCjfqsiBiVYCa7/PHYVIVWybS7eED
	 jGi5MST/AwN7lq4aEBQlofFPPr7elUAoyPpAJKfYsDDlpsD0NjKPqyHKF2i7WR6x/Zx/7
	 AoKXPuFtSP81hefCoTDSHSu+MGvVc+zRk98RMDKyNhjIlqrdgl/Vk5nqi70255/Fs5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
	b=yfRviTTCe4s+TdpnOaW4YejnH05rzxdVqkQHdxENyhv9lg3fiNiLCtrdTgnyYgjp+zRJ
	 +O+94ZJKGFRyGw4NKXAS7tf5i1rhs7jKl0XjClYkIj78CkQPDJJQjyNGO2QYzowL4ZqlL
	 X+iIc2i9SYbZhFb2+ypheZfDfUAFfjhjOtRCY8B69rnBGy37k5c9VF/eOTAasKtHxEh9L
	 OlbzWIwWSDSssWQ1c1juA+hF/WT5cYloq9W7mn4y++V/4IxNUKFngfdUp6g7fa0/TK+um
	 ERcVZNV8/oHVohD0VIeoE5K8QWvAxxyT7XZrujqKtpoOclONKnurBQMEvc+g0FqRS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B001606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B001606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2148314a91.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684978; x=1795289778; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=FZLxnZChQdyk+y/moM6mcBlLd9ZNuBhzt+gBd6Ols7VyBVMrSNtdAkaKCydZLm4B22
         ICuUw3eK91GGD4OKs5+ktA4ssURexzME56B4NihRNiC1LOxfvZoAYle1rhZIbFivaJu7
         Czn8mFXFNCxYt1mzJWwixcgMfWdYAynr0PqRdRwswhq9LYt4zcgfR8rWJqBBvYL8tK6N
         CxkwQl+3hLLGYadKwqsKLA6/xFDoBWwRD/TPGiSTGPTOQ+dR/UweDP0Nhp+uRTR6gs8K
         prGyDJbJkDZe8EJIFSo/glcotCm4LOHr+cuCkyz3RFMrcBIqVCR/ij8hj3Y8eyH7jOHh
         jETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684978; x=1795289778;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=aQjzngHfJ8twPMko9TN5qG81UbghOj6+DqEsABoib3wtLZTfsDBpbBQCG/XgdNHBAF
         9MhOV9npY1KjhLQMciPSX/md0s2i3bKrYlmnaPQ2CQ8ET1EHY4NQRyGdtVMHAijz/ehk
         RFoYAe21FcPAHSkFSJZG4jhGzwnE5mQ1mxNEvIxJKfr1qY6bQR7pCwxgflUMzS+9Ytw3
         dtAo3kcpLeCJ0C75TmB7J8tVbsWizPlGSkfblM1/l/6NXmFaSmchqtEv/crK6xCOnlQD
         ciBMsfmYpWtpopT+bkRZV2ts1nBqZ0qSuQUotE5c9k32NnA1MJbolmVSePlul8Mn7Q6A
         6JQA==
X-Forwarded-Encrypted: i=1; AL+hErGfmi0growK/UuWVB+DBIkytcCMpDGog2V4JzhUM5ENLTfjR20+oPttIgY5LZNxPttvJdtXs14=@vger.kernel.org
X-Gm-Message-State: APuU4Z+spApXOVFCJ+c2hGon/vmwcLljR1+TxUUpibvyJW4Lbc2Sile8
	UToEwwwElPJ90YydUju94rT9HJ4i9qRZtijO4ctif69X6oQULnqNwaBO
X-Gm-Gg: AYBFou0IHdAFznX8uOkz08iMB7UyeHe4vJ879xQN6Qe0pk8cfMg5f2b5QFGBwNuprsw
	FbvqDz9/F7VtrOKIFOnPNVAZ6OW45p17FTihq8upXN8TKS7OUlQQ7RBJTZXBPpUd0/sQz9+4hm3
	tLsjysi+T9Nx8o7rbhWWCuNEue8qIffYyh5dT3MpaKU11IXxqfljojdjL2EKxrQ/GQlvppM5Lx6
	emPT8jvDbnOZvPBA3aIRba5c2oCQPFIH0VG938P/P0XcT7lEpcBIR+ptjNsmYXAnZK1l/VUL+Yd
	rpQjuEpO/b7dRw6FoDJbXnPvnCHqqIK0XQ+MHdzcZCLz+UIrlbSF88KI7lngPyysI5oLyiXwtFj
	ADM50cJbvtfi3hdgvoDyxoQzid8TzHLyXLQCpGR4yKHVIwjcXjQzlCqr1oupC6TZvUXclX6VxFm
	x9faZ3FCGMqazU5OtlF3qZsxKsHfcoaTGngbm4DByTWSNu1t0UArF4XiZVeFFyWfZn89/eaBccO
	v7HjMGvnXddw+IELS0Vk2w9fGHcnhPu4n4qKfLYmI2OBApNKK6HjfrCff82vuY02XlnzEjUSpHk
	ad6yBIpJeMqTq4nzvhWGci0B1rSGUJDdGBTj6ohgs59khhHop2uNCvfJjCuFQLZRfFfzj+pjizW
	F3RROIZxb685rfQ/lUVG2u3iE4UHKh+1ZS9VhPLgVKjC3zraMzl2GuWs=
X-Received: by 2002:a17:90b:4ccc:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b1b0b6676fmr5703275a91.11.1794684978409;
        Sat, 14 Nov 2026 11:36:18 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm9924002a91.4.2026.11.14.11.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:36:17 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 19:36:17 +0000
Message-Id: <DMV6Q8SFLQ72.2AIN7VRB1JJOW@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Kees Cook" <kees+treewide@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the origin
 tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avNO8cuAdnwv9D_5@sirena.org.uk>
In-Reply-To: <avNO8cuAdnwv9D_5@sirena.org.uk>

On Tue Nov 10, 2026 at 5:05 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/cfg.c
>
> between commit:
>
>   0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")
>
> from the origin tree and commit:
>
>   6771f70a47332 ("bpf: Remove is_state_visited(), bpf_compute_scc() and i=
ter.depth")
>
> from the bpf-next tree.

Thanks. It's resolved now.

