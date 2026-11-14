Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657339;
	b=T3T1C5Y6cVNrQPAmkizQniTIA4+8K7RMgsaKSkPru7nd3AqywfvLeR1UqgjCTiNi2Rys
	 luis440ubJhtomv4Lc+B5OhxXpRmddc4XfOHJJU1XzOUB+RCBx3upn+4qjDpzJBytGJdP
	 szJ6MebAjikxOys42NGfoUYAkN9uywtkQZPJgeDdjVFpcUMmKm1ZfE+X8x5XVdQENf6oJ
	 uYE1B4Z8LHuLFJlU0Whgh9C6DcPg/WSvtJBYXHZSd3bqaUzz8kVwcxkwF4diGepviiWun
	 Df+y8OJnHH/xpkKYyp3MFalNQ8I+oEVU5XpPVbttgezxXWxwHXKW6XV15TT1dqNUpJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=lnY4IWc+y+GR9HhLwG8u1WzNm97lW5lomcR3bNkGxsdNH65HvsTabnnrqaEe5cNlEeVW
	 1jUnwP5Oqduh3LLfs7B36jM4GGpYpHK41m6qMKY5X4cihUL0MqdPgg4FcLM7jGH2k8zij
	 RhI/3/nM0m5A2PpyfEXF/sFb+eNIAaIQq8SF9AXdCWiE0TOD+jHwiEYc2HbcPSTQPdBRF
	 LLQXT+ujVfDTn2e95h0NhuuPQ9ZtAiEJx6F8TcjTO5dovyGGMTh472K2paCvdoMUKJrN8
	 A++c2yzXvSU/g+VZplPAAXwTSpniUQ0QGMQPm1j456h/XbpiPj6ZTvJNqAnvuSXfJ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D830606A880
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D830606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so132868166b.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=MrTBjpIEXzsSZaANjc7oExJhwGnF+j3pBQoJGLV3AozjECewWnT/dOn8PoCfUIeYGI
         mRgldWBhVoyoY4kjpOu/TkcCPMpetn8bMN74Irqnk0JnK5MAQS777TE3iVfENO0qNvUE
         8qb82pxhdLikkA/6tATGUpByZMee1vHTbdl6A6vtosorr3+hE9wD/mpuH76lS1WAZqyn
         nUdTyabyG8UAyWqGnpYJGfY62DgpvBldD5kNADP5MARyaYxmHHJYDsQkr6qVKrnaldzF
         KHIyaxdpU8Pcl80WjVwUUXXw+yU81KD0D8RdN7wE6Dhf//BzElFXAKq/AgQBu3vGzFII
         7JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=NeBs4RO7xAsP9YdQ2kwAgsRJ0z4KM8a1zjOl46UCNP9P13s0uLoNTgoUu0BjaC40nI
         QtgbkgQmm5JgH/XF5188n2orqK658jkJBVZm5NO3UeO5HHQMu6WoYvv5EibCK7vDPPSz
         Y1g7cOf+RGpjtHO/MTfke0bBYuIxTaH4AKtwsxx9i4QzcPf+rijk0LhxukQcSFlQzUwn
         vHXH4YaDmXXkz5CoRLffs0AUdvGJbKnBGW2S0zVyHn1HmH1luanq+rKxlmsg/39Sqzcw
         JHST4iiraGYPconVqTXdXArs4W8xj/zqkpl1L9fzGaJNb+6i+Udd3/zitISm1bmDzIIV
         qQsA==
X-Forwarded-Encrypted: i=1; AL+hErF50BMyVQFo5Ga8oGgYruiyvKnIy5js1vBIYCO/T2PXiF9KmaXMjy/2miMzRdJYCr7MFrTn6iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jT8swBrbLaYf3kA1XWnzPcteJUTfDMhPSgdsgy+Y5JP7ZImC3
	VmItXQXqwhpTQXJyllNiLuU2W9lnkZxg6Kl5o8FO9wQPPTJZQs8xDY5D
X-Gm-Gg: AYBFou1h8pxDxlfl7Xtay9oOUNcB7BSaNQBej8cf5hMPvqGnk8j4x5shbgXZ7bGKYAu
	uHZeDzhsdtx2fXLQfpJztD3TqOfJTH4D1hpPkUzweWpZ3DH04mWx9E7/5DenZPZJlPIJhKyA8Rf
	as/YN5HXSra9Sapkbr4YI06OVRdgS5CqRsOGGoecVeI6LPimn90sg277e8HYhe/lCA8kxnkTm2f
	daj85wX7jPLA6E6U/OLoz3LlpIRXs2AvHOrmaYxKreThtq6Nq02d97kO9AgZBj8OJTGrI1LWZWm
	5g8xvyLwzVS6FsU047blwKJAaT9eIdQUfj74UDcIE8tI90llYh/ydybjFvTEVqQvTtv6oPrn0p4
	1wvHpinFvQGFQyoYlghBo4Sw7++plaYihQJrBCAO2rF3kifZc35vBrcuNsTVdBzgjfHJ+EfJ+vC
	yFTeC8w/FBc3LZFXbh97jllnQHHeFgU3gdn9lgouDbZM2XVg2Bv0krR9AO9Nqn3S8XZXS0e14HZ
	oQnSCk4QjJ38Hho+JmEcJ/YSmrDTSFZxZ4XfqTQVoSVMDYI8uulX21CWG+GvargWiN6oaKwldGH
	qp9VXOoiAkkAWmonV1sJqszxryxpCH4HPJfAFJaXolRIMmV1cnCbUsc5gROgIVMBYGG1JZeFJxd
	T+QFI98FYNLk=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
