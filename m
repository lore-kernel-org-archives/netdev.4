Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643171;
	b=3Zjn5xEDh9ZWlo7t437Sn4a9uOHry2HU+s0jlTS6UEMAAfYZeWGKOFN2vpqzMbPj6He8
	 hQSabqxr4wt88taw8PVSUS5/YZ3xaWCD/66H9iTrTnKKVu9ZomRS4PgzgsibCova2M+XW
	 uzJf3XSSa+e5HHPfZ9E6hLBwzSj9WxAU5na/R3hwQapfmJzXdIrdI2LeePYo/LXx3rkFI
	 PkX/qInHr9f+87GwfsMktvXVULdDo48zx3kDclOvQgmrWFS/zdOwix/BTIrshk2LSufoG
	 /hAnDJKVEM2QY6rrod9OdiC8qjFohvui2MDyhmn7cRTkUEn6ilotbAEzhi3reNUyfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643171;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sN/vvPChvRjnihCjXMx+GKZD5EpsDE0bEFaTBUovVHA=;
	b=QXZW8xKbiOSkSoEaxLgmc92vM1KAyDQIe54qDJnkDO7MTC95pyOmxteIUhOZuIOwaKd+
	 P9NpDBQFf+/2yeywGE8Jv6hQ6LGHM/vHGQCS9bnYygoUCFiCvisqPuqvOcJ8TnBbFdeT6
	 andXLulY/qsz5YulQ4uSTzcXMVRF42Z4uFDK/CgkH7SvpYjai1WkyuRWXMHYl7CpnuRyN
	 6J0h+9J6EzZhKp0wB03sRJLwgtLFSgB+1YRBEWWZl5xS4w0AkNNTykbSF6JLBo9I8+u+8
	 +xvNYKujrrbZCD8rb+AdPUfKsb+BNpI5WiDSqK38avaxBDhHtv2MOJoi9m1FQ8AWAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FROQxim7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AkkPJYKD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF1606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FROQxim7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AkkPJYKD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795643170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sN/vvPChvRjnihCjXMx+GKZD5EpsDE0bEFaTBUovVHA=;
	b=FROQxim7NhQq+Igk9ska8V9PCoSaQWMMVnpPTDxKEvD1UQ/UztBW4kKSFiYb7uyeMGWi/Y
	DB/NrgxUw9jeLc888Wojkub6/V16GnnRTzgmKFAN9lD7oF6grwx728L/iGQT6vaM32r4pW
	ODBUz6kMVQaOjU7E2w/EmpdiqfiY3Rs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-bD1e4IwnPNO58jhnEBrfgA-1; Wed, 25 Nov 2026 21:46:08 +0000
X-MC-Unique: bD1e4IwnPNO58jhnEBrfgA-1
X-Mimecast-MFC-AGG-ID: bD1e4IwnPNO58jhnEBrfgA_1795643167
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb6517ed8bso7750535e9.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795643167; x=1796247967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sN/vvPChvRjnihCjXMx+GKZD5EpsDE0bEFaTBUovVHA=;
        b=AkkPJYKDIXBVrVw2QNrytGIe1fLO+fFEnatpFNjpK+MFFD0PzOyztg3dFKSuBJphAZ
         rUGNfarsUuMP1DvvQe432mVWldoZLMpMRmsd2zHfbisipNWsJjFsdACoscR+lmAfl6o5
         xiRypMxkiSfOvk/18zg2fCkBXZFE0K1iBZkWGxaZSjsfVwC05GCFOBHg/R0ET+NLUjUg
         ctGAtp6YKkHM9mgKPg82orvPOGZ4vMFXSOmzz0IqgtvG8FIycUmQ+8rXWAz3Y3o2afip
         4ydLEGBJ8Ra3mV4AH6vlnAsuDAEAqIfpTMzqmnRGG81U3IR1wTk5F+/TlbvgoSlxrg01
         G1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643167; x=1796247967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sN/vvPChvRjnihCjXMx+GKZD5EpsDE0bEFaTBUovVHA=;
        b=AUrgdmGerCZu4H5VzxhXP+erS1RbetLwdJxcBts35zMjt5nnat/rqG6BIS9jSzWgKQ
         YYt4aYD4Q4K9Hyr91vEtGDDNpA8ZL5FyOxIoR3IktolmubddtI8l8Aq61LzifXseE/g8
         1FlvmuXjC89ER77i0RScckSyTgPxfv7BDasulPPk3J6koDKNIRKIBCbrnW0QkToxXMQr
         o+MIz0V9dxn+p7EltMWpr80A/v1OtFik1wKXJ5acTn85clatDR4pPToXZn61dJcZ/e5Y
         P583pmr4aU5BSwD0kWOdDlL1z2oiY30Sa3WTmj62ShX+K3QuOCzN6wtjr4C58988nD61
         VHJg==
X-Forwarded-Encrypted: i=1; AL+hErGhY7e7lDTIyR64+neh3Y0RKT8a6z5JfXOzz+ZXHM4kgVCmtNnrqHdAKlNPhBpT7/DYn1FYhGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SziMRUveFmhttl1ixk3TLcEcCEr2tprwO25pOOT0VeGst1MxY
	hsRVxDkvKi4dEYG2Y/Igrq7QQV5KGWrkLrvVKwH2SaYOEhizPgk68SDlGApeQcVk8w7blCr86fn
	yrCV7IDDPyGrqcvhQr/Xm7ZlDvtcchM8s8hZikCqUbvAKzgV9ZqwfFEzysQ==
X-Gm-Gg: AZFdTZfju7+mUtOsaYxSguWWK/1C3HMGqgxZVdqgxIO575VRlo2oCioZ7CjFtLuQW+0
	NaWlRJG8iyfUWwCcm/IVF2mqF8idiWOrzfwgDPDeBUkconWhBMfJAAWuDshNe3gbyYrWbKrduC+
	9QOqT5/lQLxycnG+qcA17hUjb8kVAUpxP3hFlDlcBFek5D0k1/JsaniVaj8y26ZX1iCXzWnwsF9
	79/ssRjw5vU2xkoyPm/geSYHPMOzdnEiDoHp63CKCcHmPBSzeoPU0QBbYB8/64B9mPziexA0EHP
	tWt1BauDHU0KBsoYoMd40lO62RNrEUrVYfPkCT26FBSTsEgQNh2EuYk/py8cUg9fGcjTnx5S8d1
	/+1ku6zHKXNun38NpMvt1gQeO5iK1GB2UkT7IRXGEXeI=
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr398711325e9.10.1795643166759;
        Wed, 25 Nov 2026 13:46:06 -0800 (PST)
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr398710875e9.10.1795643166098;
        Wed, 25 Nov 2026 13:46:06 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm38309168f8f.29.2026.11.25.13.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:46:04 -0800 (PST)
Date: Wed, 25 Nov 2026 16:46:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paul Moses <p@1g4.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"chenglong.ma" <longpareto@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 2312891301@qq.com, blum@kernel.org,
	co+6dcbccedc9ec6452@bugs.sh, eperezma@redhat.com,
	fangxy@xiaopeng.com, jasowangio@gmail.com, kmehltretter@gmail.com,
	linfeng.sun.dev@gmail.com, lirongqing@baidu.com,
	oss.patchbox@gmail.com, phx0fer@gmail.com, physicalmtea@gmail.com,
	sergiiushakov@google.com, shubham@octane.security,
	stable@vger.kernel.org, stjepan.poljak@gmail.com,
	syzbot+13df72e0dc4be5c62215@syzkaller.appspotmail.com,
	tavhadia@gmail.com, tjdqudcks0424@naver.com, tz2294@columbia.edu,
	xieyongji@bytedance.com, xmei5@asu.edu, yuz08559@gmail.com,
	zenghui.yu@linux.dev, zhaimingbing@cmss.chinamobile.com,
	zhangjiao2@cmss.chinamobile.com
Subject: Re: [GIT PULL] vhost,virtio,vdpa: bugfixes
Message-ID: <20261125162710-mutt-send-email-mst@kernel.org>
References: <20261104081535-mutt-send-email-mst@kernel.org>
 <awWOpS3HR_2FTN3I@gremlin>
 <20261125060533.1296-1-longpareto@gmail.com>
 <awbTgufgR4Uge1kJ@gremlin>
 <s1xGKGqyb3Uk_gDZmeWG7nVEq4_m00HsO9pS1RL3cUnIdr4GMgH5OEBifQIl-30ZdUu7_uUoe-TxhMQd2GuW2sWKzY6UUGSWXKaqMz_XeEE=@1g4.org>
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
In-Reply-To: <s1xGKGqyb3Uk_gDZmeWG7nVEq4_m00HsO9pS1RL3cUnIdr4GMgH5OEBifQIl-30ZdUu7_uUoe-TxhMQd2GuW2sWKzY6UUGSWXKaqMz_XeEE=@1g4.org>

First, thanks for your quality bug reports. I saw a fair share of these!
To answer your questions:

On Wed, Nov 25, 2026 at 09:21:01PM +0000, Paul Moses wrote:
> There appears to be a recurring problem with how previously reported 
> vulnerabilities are being handled in this subsystem.
> 
> Yu Zhang publicly reported the VDUSE VA/PA confusion on August 7, 
> including runtime evidence and a proposed fix:
> 
> https://lore.kernel.org/r/20260807022657.11318-1-yuz08559@gmail.com
> 
> Nearly three months later, bb2e6f166547 was merged with attribution to 
> Claude Code, but without any acknowledgment of Yu's earlier report.

Mostly what happened is that Jason left RH, and at the same time a wave
of vuln reports hit, and this one got some "critical" sashiko reviews.
Which I didn't look closely at, but at the same time, the reporter
really could have responded to, but instead ignored. The patch was not
Cc stable, even. I could have looked at the patch more closely and
noticed there's a reported security problem and tracked it.

> As 
> Lorenzo has now pointed out, the accepted patch also breaks the driver's 
> mmap path.

yea, not good.

> This is particularly concerning given my own experience with the vDPA 
> netlink double-free.
> 
> I reported the issue in March, submitted a patch at your request, provided 
> runtime evidence, and received repeated assurances that my patch would be 
> applied. Nearly eight months later, a different Claude-assisted implementation 
> was merged instead after I reported it to security list a second time.
> 
> I acknowledge that I eventually received a Reported-by tag. That does not explain 
> why a known and acknowledged memory-safety defect remained unfixed for nearly eight 
> months.

I don't at this time remember why it took a lot of time or why I chose that patch at
this point, sorry.

> I have no objection to the use of AI-assisted development. I do object to a process 
> in which previously submitted security fixes remain unresolved for months, only to 
> be replaced by AI-assisted implementations, particularly when those implementations 
> introduce regressions that basic functional testing would have caught.
> 
> Why was Yu Zhang's earlier report not acknowledged?

Because the reporter didn't follow the process.

> And what is being done to ensure that previously reported vulnerabilities are not left 
> unresolved until they are rediscovered?
> 
> Thanks,
> Paul

Following the process helps. You did good by pinging repeatedly and the
problem was fixed as opposed to rediscovered. Thanks a lot for that.


I'm not as quick as I'd like to be. Make mistakes, too (
If more people can pitch in and help review patches, that will help a lot!

-- 
MST

