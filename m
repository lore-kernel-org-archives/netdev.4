Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357548;
	b=jYVUJubMSqTn8x63IbllbH0mmq5u1xIqaGhXDRhVj7Kc4Xa3NWB2e0yZP5DU9lnBDPwA
	 SDrvkrYOvUTIEn7lFFInkrAF30iwLO2GAUAKiF9i3Xq0FdZ0IiXRNolI0XksbdOe0JkUM
	 J23JRIH1TK79Idsjgy5OInR1TlKOAYwbKTph+VVDI8lQKko1jYiybMJu1bEEe0XykUe/l
	 eWZAM9a1vmJ0l1r2dP/BdBfSklLIMQ8u16K55eC9n0sFCyUdyUFGRgESkXCsqnPkIHSaf
	 ZTpjspFvdIpG9Qf6zLhRz/j3Bw6Vn0r9F5B66LMJ8sdvC7BpRI94mb1ZM7lImq6+DDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357548;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
	b=fUkYzjCPOU54i6U/g7yHMbkQQRR6Wt9xOx80iMEzSbzVPyGl4t+nZ9qty1RZboV6vd2T
	 cVxCrim/NCdP3+tumd5jAwTKD1XYH0bMfTnAb0ap/pyt1NzgFj3yu1X8TLNSKh8IgnbVS
	 OvLbZtFP2VLD03cv9hJ1MqGJUlV84wiDg4+163TppZkHyOIbnGcfXgzVbctkjZQyn5hv4
	 vjlPOQjJ1oDr8QQhmcj4k3VMAsNu1HGs8FV2rR2DFEI8Lk4vr8GOHpfSoEro9q7dr+pvh
	 gJ6mwM+AzPCWH2TCFgKg5x65WaUeWdBLdol0PK2klPVoRpxiEvZb+JCe1pVNU/9ougQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ds1gaNjL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjmK1+iP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D81606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D81606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ds1gaNjL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjmK1+iP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795357545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
	b=Ds1gaNjLhb5WHwmCArop9JDrDXaIzZaDCP1OgcxsXrfRPeCRS7tpwQh6iepWN2+K7FlEfe
	E2QgMckn9Ttq9qGTkrJOeLboENGuHKYbjDKKCkoAG28mpbnjdgPiMdz/TcQXCrtNmEawKj
	KnaN/vzkRN6K6vnjkAFSkZzZLJ9OyIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-hd79qlk5MRuj8J6PAVPwLw-1; Sun, 22 Nov 2026 14:25:43 +0000
X-MC-Unique: hd79qlk5MRuj8J6PAVPwLw-1
X-Mimecast-MFC-AGG-ID: hd79qlk5MRuj8J6PAVPwLw_1795357542
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso12057545e9.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795357542; x=1795962342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
        b=RjmK1+iPYSd7kHyy0tJDRj9S17VyfTcMukIkM7MzAGf2d0rRNITym1te3WevtWlhHr
         HbckHHwtnTn9i+Q+NMshydqHWZhd+dztbwjqS8rC/dVB4C+ePqN+IGCHKG18hFg53fL3
         e0FaV/WQGpI0ShjPDMqqdEW8Lx2wYDmQSBreD6L9ukv346GRG+pkZfbNxHIjtwGJZikN
         98LM84lB5wbpFLeIeBjR2AjfxscgodYM32ZSXr/xdTGHkRnNiJDZ2DH5oc9IURrak1Kd
         rAdClAtGndNIUE4uZoU7cLoJgtuhX14HctSnCAhm4XhzSP1ONXkfYM1+/6mKpfEtmDHR
         8c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357542; x=1795962342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
        b=SlMRCwBP9+g2WvphyHTtrOG9mNLP7ftxNRefmeSz22YOx2GPufAAVK+6jM2VkjncO7
         mRky0C+qPLQkpE0pjIbscurSAClGVS2iqhS2a51WrTYDpd6yi7My+GSgLL1yVNerv2mr
         WHjYylov226rznwAgMWT4wf/FDjBOWyAlcC43zuY0QNDVaKy5SdTrWttdP8D0lunMO7D
         2rmHb/S52THK4AZDrT+qRau9gP4hqzeBi0vTB73glDkCzuA8V8mMjBP2TszXsZrdVKwu
         4VZvoTaKCmoPaK8PLyix+9IxJ1IbCWtxw3Zuf4BmUwWPDRc0SCTuM4sEqujZEOLRJCeE
         L4RQ==
X-Forwarded-Encrypted: i=1; AL+hErE0rIyd0T/vjiWAuysMvmxKyI7Mq6Gyrgcxv81k4CpKUwmaKycnEgFVo965XRXHWH4pq0j1Vl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+H/2cKvZH8Q6qlkHOQ+gEMiQdMCsdMB8jx1GfoL71Q6WaCcW
	oGH3wQAA3ne0leT6eBfJjXuhdEnbuq3oirz3ITC5Gu+b095Q0zQOGeO9y5S8bzQsOS7H9B+k5D8
	kIfv8nrmqxVud7PtmMUMe8FnR/jZnUKUohh6qUDFoZaIsBZAqSkIoBgGgPA==
X-Gm-Gg: AZFdTZeLtqqb552503RO7pt3EF62/XXKCj6JY4ax6sdc6242LrUiwsClQndzIau8Hjm
	xVOD5qXljmoomVBNHohYNIohwK+Y6ys5FA+HfuKj0cw8e0UFWw8gnKlBK2Xayv8/2fZa1kj981u
	YSuWK142E3xFHWYbJroEc0ENsEH9ypSkWW4MNR7yJgTR0q2xNpRNWTg/OqJm3gkZrAwM7IhB41l
	3N5Sssxm7TTWDJFSP3FGlVRR5V/FaPkwc/cG7zYT9iYv0mz3Y2FbG+WHT+vxyqnNXvoUih0eOy3
	G+e1V0eKvrKLGgCvyGzokKJWtRJ/c2OQce2D1vcQaU3uH0nO2ssHRpk5yM6qYKdsqbKzeSXAmtV
	dR1C3tDTO2ST15ShnJjAQg+cm9w8/GphnVwPYdAIB
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr184853415e9.34.1795357542239;
        Sun, 22 Nov 2026 06:25:42 -0800 (PST)
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr184852965e9.34.1795357541679;
        Sun, 22 Nov 2026 06:25:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm271466675e9.15.2026.11.22.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:25:40 -0800 (PST)
Date: Sun, 22 Nov 2026 09:25:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Message-ID: <20261122092235-mutt-send-email-mst@kernel.org>
References: <20261122120919.1718445-1-hengyul@cs.unc.edu>
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
In-Reply-To: <20261122120919.1718445-1-hengyul@cs.unc.edu>

On Sun, Nov 22, 2026 at 07:09:19AM -0500, Hengyu Liang wrote:
> Commit 333c515d1896 ("vhost-net: allow configuring extended features")
> added VHOST_SET_FEATURES_ARRAY. The ioctl reads the number of feature
> words from user space and checks that every word above the supported
> ones is zero, one word at a time in a loop.
> 
> However, the loop has no upper bound and no scheduling point. As of now,
> a caller can pass a count of U64_MAX and a pointer into a large
> zero-filled mapping. The ioctl then stays in the kernel for as long as
> the mapping is readable, and a fatal signal is not handled until it
> ends. On a v6.18 debug kernel booted with preempt=none, two such calls
> from a non-root user, each on a 4 GiB mapping, froze a 2-CPU VM for
> 56 s with soft lockup reports.
> 
> Interfaces that take an extensible structure from user space limit it
> to one page (openat2, clone3, sched_setattr).
> 
> On a KASAN kernel with a 1 GiB mapping: before commit 333c515d1896
> ("vhost-net: allow configuring extended features"), the ioctl does not
> exist and the call fails with EPERM at once. After that commit, it
> fails with EFAULT after 26.0 s. With this patch, it fails with E2BIG at
> once. A reproducer is available on request.
> 
> This patch will reject counts above one page of words (512 on a 4 KiB
> page, or 32768 feature bits; 128 are defined today) before the walk
> starts.
> 
> Fixes: 333c515d1896 ("vhost-net: allow configuring extended features")
> Cc: stable@vger.kernel.org # v6.17+
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> I found this while comparing the behavior of different kernel versions.
> I used an LLM to analyze the problem and to draft the patch and this
> message, and I analyzed the result myself.
> 
> Tested on the vhost tree at 44293796526f with KASAN and lockdep: counts
> of 0, 2, 3 and 512 words still succeed, a nonzero word above the
> supported ones still gives EOPNOTSUPP, and VHOST_GET_FEATURES_ARRAY is
> unchanged.
>  drivers/vhost/net.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 631855064b3d..22e06b44d2ed 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -1795,6 +1795,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
>  	case VHOST_SET_FEATURES_ARRAY:
>  		if (copy_from_user(&count, featurep, sizeof(count)))
>  			return -EFAULT;
> +		if (count > PAGE_SIZE / sizeof(u64))
> +			return -E2BIG;
>  
>  		virtio_features_zero(all_features);
>  		argp += sizeof(u64);

????
this is followed by:

                virtio_features_zero(all_features);
                argp += sizeof(u64);
                copied = min(count, (u64)VIRTIO_FEATURES_U64S);
                if (copy_from_user(all_features, argp, copied * sizeof(u64)))
                        return -EFAULT;

copies at most 8 bytes.


did you test that this patch actually helps anything?


> base-commit: 44293796526f4343639f87b2acc53811c78b5d54
> -- 
> 2.53.0

