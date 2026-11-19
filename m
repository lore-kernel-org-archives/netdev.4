Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100589;
	b=Ob+d9i4Ctqwi1z4cN/Y5olc7gBW4S0xMJjDD/BQSOQCRw1PPjx47IVKlLGwqCnSqAJQ7
	 e7sf8KRrNA7zzl/K2Zi94qE/ISFyWOcXlIfk8Ap83vOMliZ0KGn8/BCz0t77HEinD2GYH
	 EhNUlY1KL85UjRzGPlyUWJt/D4va6lnhN4KbfSRx9eVKy6Qn2GidmcgE2LnJHxJ1ufnaF
	 lCQAhFiHh+EPcwNxcq/lhTzRUzEkWcDGkyQK4aZALlV4CSmzYw+pHz4NhYTBFTo+qlFZa
	 6XsxqHX4M9HSV9vspP2neL7zddV+Dg1bsLS61R36CmJ7Op5MP8kJ+oSJ6D5/l7WrhlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100589;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
	b=3YdVVQomgDnJJybYIlpZPSit4YmtQSBH92yA380I/J/CRXzpu4LAbG7YDg8I77vNiRsE
	 4T/a9F4BYQf11jQshoKZx1CbjZREL4uhw41Ai2i0xcstKDuuLu7T6hj5vu8stauYEx0tX
	 wlozOIvBargkG0RG6suDGKcRxyq8I8CgqrnIdFt/9G8av6PNZaUcPvTp431ywDq12WA5f
	 vKB+bo3lNh+/3bYJicyFPQ4quR/SvRoTPxbkgiqiyFPKj0BMyC8aPvUCcNrezvMwWCojt
	 K7xC2F7KckoQSndaH5TkUFIe6v6WHMPtanjGA4xiBduLXXesEI4R+QQ4H501ikluKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHNTkOXX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ggIRWTWj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC1606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCC1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHNTkOXX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ggIRWTWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795100587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
	b=VHNTkOXXUeLx6GRqErVXLm5SLvTCVWQSjvPItgAO7yKArQHIrRX81zWP44O5STvSZqACiM
	LXXG3XsVX3Dg/ohy8KiUz6LxnICr0hlVUHtlvcnQ5NUljd/+CVAuiz971Pb8Kz6TV0dowW
	hxepm46rpWr5GBqV+e5jUcTyZyITDR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-5HEUJOOwMTCjIW5iYKfQUQ-1; Thu, 19 Nov 2026 10:03:05 -0500
X-MC-Unique: 5HEUJOOwMTCjIW5iYKfQUQ-1
X-Mimecast-MFC-AGG-ID: 5HEUJOOwMTCjIW5iYKfQUQ_1795100585
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so24771855e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795100584; x=1795705384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
        b=ggIRWTWjIyjtQGlFj1zLr/5Wj/VtHpEyaD6RXTFgmB5IQKjR5URhSiL3rFvYQJc31T
         Vd5KpwQZyDTx9X6gcP9k1cAkHCgDUUMYdBjPpyQc3qVTPj+uquf7+MA3V5NVPNLvfvmk
         Pir1KM9WszC+njKJGG8Uq4QbBRafxcWekzME+ErIbSX5l/wi40eaOpf0C+TuqmX/TwRg
         jmEfGmbEGaYqs8PznAeBIAbGWw3pYzJd9REqpKHPAqcWOU6Dc7VYykOg/jiuYB4ifpwg
         MvT7VyqcCi4QCBjFzolohCc9psn1QFVmv/8vC0ZldYXR4Fpj3s/AeRuDf89HRShsqi+U
         2vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100584; x=1795705384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
        b=ND3qm1yA9AIuctB3m08TAHjKAVkQJ7cmfjKMFccsSRG86sMamTwb34TPDLP/yJ/FGn
         pMU9jCtPli5b0pK76r4c159HOZehJ3xdvqh9OgScJjElGwcKGCqkcck8+RBX4TKoiEiA
         g4GkQhgiKQAn1JJdZQPILp1A6IovUTPUUkK3P7VwnGtTsTl4MLld75eG+Wu8NLKbMPtU
         Ehdc9wlpR+bGOqH7m/vGDSIVoz2lC1ULwesnQTbQds6ls/dBXRgaGo1aAthSb3155pgN
         G6RRCEAVBY71wv+fzEPPDO0wF9AebZ6kEKV7qmSXLXOf8o00WPao/F2mKrXElKmETn1d
         mPbw==
X-Forwarded-Encrypted: i=1; AL+hErFdcjLD1HBu74QJXMGUDo+LIx3bfQ7q4A9GQjzZ1wWlVUFwtDtwnktcUvxlj8Z+4lLtcTCqMH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ens9edmFOZBuo2qAirfmP89Pk2oU5eMGzx4Caf+5IhjtXhxIW
	jNqt4AAoR9ROffhrEGjYJ6EhYwdb/GpJfLEbfaNJpVbhoyEOfCcWzGgml0LfUym3L0ybtG1Y/yM
	IRfNxmzdMX50Ua1EkG/nOh38YiGhurCAIt06AAAEpaZE7lNFeDO7LisbHK5wybm+NOg==
X-Gm-Gg: AYBFou3GOLixIMZWtu/+kR+VfZ0r+pDr6M2f1WdNQU4sysguAN0jaGpmcFIOKlfL0Ed
	uemLj21+NjcmPkW8cxUakq/LlxbzliJt2r0ahyzlwDYQ7bOpHNsm2lEo2tT41BdEczUxAV8nyvh
	MhTUIjlJ3rqySEh1T0URFyAtnCJOkrxC6MpWnvbjyWR3h+BYLHT/LA3uvFJr/C9XK1IYNZ7ES5k
	8oVd/BuL69UuQ4I4IhBfb3I7zzaI8JKk+TwP/FnuHGEk88mAFik48QH1B4aT7YX3GpKN/JfBWm1
	yfMtQi0XrlFNqVR26+P/m/u1Pkdbwo+EvW3RVB2dplXelKpqqA5ssCYtCky3OPA6RP4YNeLSr3h
	ex7gEDppIc0XFsn4ay4DrhmnfWZAjLdRv8rzjWkoX2w==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr127466855e9.1.1795100584441;
        Thu, 19 Nov 2026 07:03:04 -0800 (PST)
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr127465905e9.1.1795100583800;
        Thu, 19 Nov 2026 07:03:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm2590845e9.15.2026.11.19.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:03:02 -0800 (PST)
Date: Thu, 19 Nov 2026 10:03:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Xiong Weimin <xiongweimin@kylinos.cn>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vdpa: alibaba: fix typos in comment
Message-ID: <20261119100226-mutt-send-email-mst@kernel.org>
References: <20261102043526-mutt-send-email-mst@kernel.org>
 <cover.1793860522.git.hemanth.selam@gmail.com>
 <e68b7938e19affe2b18ba0ba9711e079fe1f7084.1793860522.git.hemanth.selam@gmail.com>
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
In-Reply-To: <e68b7938e19affe2b18ba0ba9711e079fe1f7084.1793860522.git.hemanth.selam@gmail.com>

On Thu, Nov 05, 2026 at 12:06:53PM +0530, Hemanth Selam wrote:
> The comment above eni_vdpa_set_vq_state() misspells "specification",
> and "ENI is build upon" should be "built".
> 
> Link: https://lore.kernel.org/all/20261102043526-mutt-send-email-mst@kernel.org/
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/vdpa/alibaba/eni_vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> index 1288402d3dd8..af163b4f9259 100644
> --- a/drivers/vdpa/alibaba/eni_vdpa.c
> +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> @@ -276,7 +276,7 @@ static int eni_vdpa_set_vq_state(struct vdpa_device *vdpa, u16 qid,
>  	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
>  	const struct vdpa_vq_state_split *split = &state->split;
>  
> -	/* ENI is build upon virtio-pci specfication which not support
> +	/* ENI is built upon virtio-pci specification which not support
>  	 * to set state of virtqueue.


which does not support a way

> But if the state is equal to the
>  	 * device initial state by chance, we can let it go.
>  	 */
> -- 
> 2.48.1

