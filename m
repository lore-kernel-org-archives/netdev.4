Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=mep2Ygo4giG5NChAOrX+ixsrN/qZhN6YKI11OTHz8lcU7cas53rsckbENU8U8i9vRFfY
	 miD1Drr8hn2nMJ40hSoXWpRoKrVkJvBjO3BFb3u7uJxr1/ubHyyjrqSqfZe3tYtfVYkQR
	 RBmDsoJtM3sgEIOXapY9CxEJ9JGJbyYi3Qwb9MJWo4pCd3I6THNjkV5ZiJwfF2otglLfj
	 ltnQs9IzOgD6sNIpqgC2y4ajdbJGBI/ivBNB6MuVBBOo54VLInFm6DKmhzq2ikmr3iIC8
	 M/zW3V3diOJrDg9Foz3+9eMfxv6PWkKhE+1eem0H0RqqZcslmkU+GAROMwAPaMPXFHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=ABYJmoDML8CKjIy1Fx1RWVnalfnwpOQ/ze2vv0sdxst8lIi8GT7gmTD7LVvHkRX31xwh
	 J4tQSJKsGMYjA2IEt9O7WgyBBsGtDch5USc9Hr87eQjEGdblI0oQ29WhZAFlVSrdabGH1
	 xVfm5YMpikfA3RQ8oleH20xGrZGqZH66PFfu3r876Wk0kvz3M+/ZBAXBNXAE95h9MK7fQ
	 yA/aeqQfRssfasONdLF1szE6S7GhkJZGvgRfLxvOkMcgiMecZemqWCI3pXwa86BI3rwmJ
	 6FyMICLrKTX3D0Y8upyu5lb0rRbZoOe5wVmG5/AOi3f8mne5iwsNMFdFRrCxGgV1Jng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E146606A8BC
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E146606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so814320a12.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=t4xxtvlP4RAICjpBIWPIkESb6EJJVOcRd9+LEytv251d1ZQsfD2pYblwETMOf/zroc
         BDzAo5elUgpAiRA0oYEfExHYSjjGywxztBxThvGs665InMbo4S8LytfXKr2B4Cw2IX6x
         hCl30XcWjOl3zGKKK0Vny1KN9lt2zjyLiPz3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=qPC9r+/xETPW4xniy07cMaxwbR4T/V9oaXL18n/IDS2MVywFwHHZFXRj6j+A7oZQJA
         QE9UeLDfDJqTygEgad18p+hg4GYAb2aNOE5K6KVSFnkWvisZv/R+4/fq773vcZ2wbUNu
         WVazv42XfQh7VEC1zWzWARCEki+S3WpOIlgjKAsx4/eNXaD0qBNGnUtaCyvww8RqkjnA
         /RKwSEflFFYqkOc2s0HNj1391clN7wjAYj0VwLg1ZHuNWr3hLXSR5AdVP6ntpE9CBvtw
         3Pw1ukWJDh8YqoxY98P3A72LaIG/Gw6i4eHmZFCbV8bdg+4hXDotEq3wurWWtj3S/WvI
         pm+g==
X-Forwarded-Encrypted: i=1; AL+hErGUQo6SlNcj/ilvkLiJCG36WKgFuezbXWKrO89fsjeq1z6/wpelgdmlWwhvjGsMRgxf+nDx6RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b+Adf2n/+ShzTH3NomuqPkUvIGrw5lyaJ8MlvhEr6Tas4jz2l
	vsqaoql1D867u0oaJ2DcTcLaHTZ21HaERMKPj9UzSNcJGEWU+s8xmKa8mNyr3ZBs5R4=
X-Gm-Gg: AYBFou22eQbMBspQcIQCGJhRTeb7NMPMCki6vL57STufAzoszYwMNfHwK7I6huRgAsx
	TUHzKLyoRN/w5kQsvURN/sjzKU7lnNl9Lp6KjuRMXA8UlzUWDa5wjM6Egymc2+L05IRk/3WJsld
	UHsPTxBQuKiC9P6UCI9yQK9m2ynUovOehahyBVOz0EsKkK7YlvwL5Fh9tjKHjmfujpuhIJHeiqB
	VHbfz1ehLVRARVLgEZ9vFdsB2eQuEq0L72VMQ316He+wtF9HWMgrMHNLJ/ilkEJbQ5xfviVMTxO
	M5Q//Pi0fjM/Wfe2jWsBAebXOEhMn59473T+7jGMu6JWj7L3M0mEJWEHgi6RFqIP/zx38Fv1G1+
	GOOc0PgkgMKcmUibAnSqzoE45obVajsErVJeFIWDSu9v0DWiWDp9hcSEbf8CUGqy9B9d61s/TLZ
	5wjErLdwbEybCt9fYeJKcMCErPszdsVM9hojEQFoS68T5OpXnSUpmhbwd11Js8qjaZS7zUHX2XC
	tFewla3hWN3rcZQKXzbXf+GyrGUOC7sKi88y3jzztniSIniTUFJDMaVT7N7mKCZY+o5VKv8EfeG
	bhlnXh/ziyFSMmC+YWTQOumUXVyvRNheevmVc8GzN60oB3K0oXQQJRZiH8MQY8fLBvN6NaXmreI
	iP8nqpHtA//Z7TKtyzo8vbzxjTgBobuV3x/SWlkJwtrdYv5gY2fLgj9p8o7cPbFW2/ohF/5aJe/
	BSB+YBI1WqwPOPLUyu/vkNa/xic2qzw9gUXDpfwRqxMlASvgPnVYSFSGYS
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
