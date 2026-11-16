Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844991;
	b=Xdiw9KWBDKlmzzpXDhl3lLl+O9SeyGeNC7eY72YguG4PmaGov6ZmENBssL7EQT7r/vp2
	 7LAdVA6+T/t0z4tFxyMSxuOaFgsOJoyEcI4PQfbVmXW0reFN8ieblfMFJOvZdN48aq0DJ
	 7DjyuILHiop/y9BDKilzHcVVnoO4c44CLiJ+8z2zX+MHEfRXBdTwZP25Zg7DdIDAJqP9V
	 WKaVUPbU4T57PmzB8vpBgoPYa697j0Eo0HugBlyZr/HjmWYB36cXrBfTjv1pUaNH6sLvc
	 EUX17edP9JIPjoEbFZHYLx2cWCPlEJrYprDNCTF/dy8FUGZRkgjVRMpiVMJOTWRvI9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
	b=JILbt+osEqd3WQkBjbeOSfgSnh4BTAJAVcfziAyg6dsJMyVQOLv/tke6lhjM+VQwmRbI
	 fY2spgkL/N5r+1L8lxERqrD7Miax+Ttoc9BnPIGCOynHGqH4qRWalOGdWulDPNW5WhmbE
	 +CjosItwT3L+1nwezMirpSa1OopVCLbJQpLxBmdDmzwFbZ6YFu6GAK79fi6sM8LakxoYp
	 Sa2MTiD0Ksd4rpVzvHneDh3p2exl96TCnyS7IYUjqUXWIrxfcrZfj81xdDXI1YRI7HUZW
	 r3/VAtJF14Ig6rbDxrVZaeTE7LOrc1vzEfVo4As2In5OvSSUwbAGO6mh7v2ossExi+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27B4606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27B4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9eb579c0eso19975905ad.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794844990; cv=none;
        d=google.com; s=arc-20260327;
        b=b3srLxgtt7qcxA6Q4r8LI3I1iHTq9C/pVZnFEbL9bSOhP/ryhs4tWYE7vSaKKWvOaI
         qoy2A61Q3i82hS7YwFdCQ+TBn7nVDOCNOQJk94b+iJwmx81TbVVgHA0Y491ONbJEe2hq
         wouhXyGVdKwKo4jLAvvcv3RjGLUsQDFcRY1xqaZN8E3Qv48rGGeIlpkVJy6lMj4yChh2
         PCoW9XCvDcQRBAXBqpbRyLmsHl7Y8z6QVNk9dHFcznq1HLouRtTh1fVk/QP+mG/JrQg0
         FwKvAZwOk/QYsyKuD+ivqmurRqrGTtiF25wD/AisKPJzFJCrpuX80851Pe2f0WQTAIEo
         JIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        fh=Sz2RsLPYtU29ufdk6S1KTrV0X/A3Mekblnx98h8eJy4=;
        b=AZDYnAihZgF/aUiHQXMSv+BiBfBPR40EOxq7mNLiwPX5LJytCqmIby6N5v+FKKaKtH
         iFzBNUQhFQLZ7/Io10YJQcnQKCHhpy8XN0jHlaLo6Rs0c3lRCPbtNQYj37DZonYbQ0wl
         1do30VY0NXPsJskt1FOzNao3P5DxalyHeVkRs5a4Iw75ZruTRyRNll8uLg7oAh3wQ4Jc
         ZW6VvCeoXCssEIA75oKnWgmf/s9pw2a1l9UlzU84K6WEIPAiOCpsl0dmmoNM1ukJeRjS
         B353cCom09WOFDbOiagxtCbQA80YGlFbISjBCQR3sqNxyEw2BN0ulJot10VszJjoggeg
         Bkmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844990; x=1795449790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=j5+qfPZWt2MiR9AwyGnuSWff4kqLNf2XZOiwJnxZ+Fv0u1xxF4OIzba8auw2DFGria
         RUb2lc0JvJCxRj6Sp5wd8n8GN+fVHAzINHu4GRUl3yu2yHMI501c4wW2crgydaFx3jsE
         lSM2odqPpPWNXbrGAKXoPpmlZw5EaXH1hh87buKYcgSywRmFBtM4pSnPlvXkBQe4++xh
         0bQTuOm9SoWLQT8EZjRSo/DtXDY558fBXgN3Z+o+1TrHGsvMJ7HiAuWun66rYU1dHnWs
         VXb+7U5JpdSFegGhqgYMC5nLUFcvstgH/6u4ood/1y0JA3IoK1AR6cJ1RlH2vVzkS7hV
         zBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844990; x=1795449790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=A+ao52H6/egrVu/X6fs4sn9sUu/n6AbZzb7KvkWPyumIsFJphBLXcqRXRXIRLEndyk
         M/kM2mEkU2rujRnNmmteburM2iV3xRSO+dVJ0Iy/WVZ1sk19mlAwKW3SMXWjB79+shao
         RKTK+wvgMfXHgxBwF/CsMs8QI8sa1SZxXrMgFEmhXszEKv4h6kWTp41rjMBnHYdn1JER
         CR62/2iheShPGuaz1ayh2q2cEqFm8SLFXAnMYhHorKFbtqRGQfYafIHMBEiP16CPy4uJ
         f7nQfmdfZUO+UK7uts3wBY2c5pCX5aN5ewpoHbRSX4AR1/gyNwE3Iyhe+7DKfE7hYCmz
         1WPA==
X-Forwarded-Encrypted: i=1; AL+hErEQxoWGmnWQHBTWmQOXT73//xpSO9dMC47tjnzfz5AhP9TNkX9fXLwP51WNSrA3sRJ2cH+WVEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EhGpMFBjw1/qMLcKJLUFbAdfgcNY6+P8PyrFr+GpbJ0EMgniH
	h74yT/o5ipfLy6Srkjw0Ul33X9F9AUS1GmfWG6D922Sl50uTA6McL3kA7cP0HglzGgBQzcJdcia
	snTk1b2J45kpmurO8Q+61V0KnlUGquAc=
X-Gm-Gg: AZFdTZfNemiHNIIomxtnn9YMPnTifj6JLhVliLgcOvblxNM5eLRyeHIObBAk0GxJsc8
	fsLOejOU0biioGNLPwWZojkh4/YAJZ1tHia4SydoHSYN710++Set26DFTiYmVQziAR1qG3G3dTf
	thBBFj/u2jfDrY51c9neaMgxXpBBnGOFtwx6KskVOa75NB4WpZNMCzLhUTCGxh/RZdNd9nhljw/
	e6Dqt5QKLPkc81OTsuF441uWUEh6ndwZeiNAly8d7KzieXJGnezLuTY6sJb3NN/qJKhmatDDsqs
	H5L2f9+tRfXU30CjQYiRfAHGTDMsUf9xz+TQsdLfddJ3d5lCN/6ntW9HYG3oVwmuMks21YLAAZ4
	hIkSE7Wrj8lSGNZA1A06lbL/gJ1qGqB/XOokCXedLYKl7JvOsd1B/szNcRA66yYT+vUyy0Yqknp
	EFb3nVozjCoyubUG4iGWe3763Nk4IOE4nj8ATAZ5ilmW75l1uxwsbpm9pj
X-Received: by 2002:a17:903:3c0c:b0:2ef:d952:4a70 with SMTP id
 d9443c01a7336-2efd9524f10mr160655ad.15.1794844989621; Mon, 16 Nov 2026
 08:03:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avsfpHqbu_rdmOrf@sirena.org.uk>
In-Reply-To: <avsfpHqbu_rdmOrf@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Nov 2026 08:02:56 -0800
X-Gm-Features: AclHuK8Zde0ypoKNoy9FjTToivHq-RePvO_-KQS7SMLakIHz2MwjMtcG0NQBgHE
Message-ID: <CAADnVQKjK2ezTcTUfQLACJDBLzhy=aBvoiK7L1cqKmb5RE40CA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf tree with the origin tree
To: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sergei Nizovtsev <snizovtsev@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 07:22 AM Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> Today's linux-next merge of the bpf tree got a conflict in:
>
>   kernel/bpf/bpf_lsm.c
>
> between commit:
>
>   ea8c4b37b8809 ("bpf: don't mark namespace_init and namespace_free arguments as trusted")
>
> from the origin tree and commit:
>
>   ab86b62012b9e ("bpf, lsm: Mark backing_file_alloc/free LSM hooks as untrusted")
>
> from the bpf tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc kernel/bpf/bpf_lsm.c
> index 468e63dbd922d,f39a3766f2245..0000000000000
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@@ -411,8 -411,8 +411,10 @@@ BTF_ID(func, bpf_lsm_bpf_map_free
>   BTF_ID(func, bpf_lsm_bpf_prog_free)
>   BTF_ID(func, bpf_lsm_file_alloc_security)
>   BTF_ID(func, bpf_lsm_file_free_security)
>  +BTF_ID(func, bpf_lsm_namespace_init)
>  +BTF_ID(func, bpf_lsm_namespace_free)
> + BTF_ID(func, bpf_lsm_backing_file_alloc)
> + BTF_ID(func, bpf_lsm_backing_file_free)
>   #ifdef CONFIG_SECURITY_NETWORK
>   BTF_ID(func, bpf_lsm_sk_alloc_security)
>   BTF_ID(func, bpf_lsm_sk_free_security)

Thanks. The resolution is correct.
