Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830458;
	b=0zcPHhetww1IiLEgBAyKRh/3Nb1Ms/IWJ2r/688ajgni3l6iix8oTATqqxLKFy1U06Na
	 aUSxEDwBPDhtMV2uXcvGSMA/8LDNidkwXaXTySJqo5KZMOkuY9Uob1GWv75vW9fdmjaOD
	 vsn03HxE5ioPGTNplf+RX9nm+9HP7ulm3GVrBmx6IZDp/47wtLsae+21dkhMxdkR1Oa34
	 seCCbWnACKpVMo1HtCne/KB4ocvZg0bGBFJ1r3STRaj5rDKAbFazYmVEkHpi7C7fUgM0+
	 DNzA++erLqKJgVBHVi9TYtsQEVSoBtS4LK5C3vpGrwelMmvWeF5NDTLrUPxKNayFRuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
	b=Cf05xIlKlXSNIz/qsKAFBKqKl2EfrNRDx6gHaKLgRxRRbvnmhaGePLNqj3ItvXTuqw4t
	 M5e6XnloBCqiqTc1zatOyLueucBsbY7gQW+wiermkcmt5r2NoUN9RDfAW70OZYd/S2VXE
	 jaa36D/2hfRWYkyJYCsqHSPGSCppflM4UhtHPBXM2gu/ahpV9BxLrswKXxQrYxiFEKjOU
	 AQF12vF00qqy+3BFda2VIewXUuIWQegADQm/qQk4Xo6lpVtU/kIhORVIhBVG0Qhhx9ktS
	 JCdZ9RUhjH9vdLu6IPqGya1t8saiSlOssQ+9hZDPKNp2xLT04Wlpalmn02TCEmT/Yog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D342606A338
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D342606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so2973441f8f.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794830456; x=1795435256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=HPhDK7mhvKoexu3wV/J5cAKBVCjdxnE0WqiM219E8yH7eWl2bpFOUxbsfidw15OaBQ
         3v/oOiLCUqOJKC7nE/sfeHMGODuUIsJx0HNirhnEfTrkTSlF6mxsAka4bN3HHTEKuz8X
         I7ILCePljUvo3TBsSDLONNTI31MYsfntJafmj4EM/wfNH8zBljPNWXbjdXsxXgFWpxK7
         QBsjZgUghWzTrvW3gB62VO1cEaBa05GYc2ZRtlRGIidAi9COFMIabjVojBmfGFLgZQra
         H+ROglAj/Ny78kycfy7M7MzfDC6v9ICyF5eD9XUlfn5SvIi4OODpHA/Ny8dfvpbuHFYW
         7n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830456; x=1795435256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=JACq/g9eGcoAxvNY043EhhxqbX+V270WDvKjInUa4w4Skf9/ob54gzAc83o9H4IMSA
         FFDQUo7XhsECQX0rz8+sJkyEQ3E0XsuQIYm5LbzZsMHHklbtd8UVbuJW6cAHCEkRVLAG
         YGPpiFkx1o9/Gtg+Fp4HNGKmC9ZxtrJiLK/Iy661X+iLoh/V9YwEgDUsd+WF3bzi6bZw
         jxKxq/qnlFk+9xNNBx4CDmvwHdqYN7KV+8pqbghgEj2Uyt1nxfDK3aw4fIDFqAHGaKZS
         YUebmTPCaiOttAsix1D0cs9kCmkMptl2ncJ1rz1nbzY1SYzzf0RHlfgRAH86xV++JyVL
         MJig==
X-Forwarded-Encrypted: i=1; AL+hErF8PWZkld3yW4a/jZqH5UeotCFl5tNpSnQHtKsAV/HC7YWfIIaLV2PQb8BSonX+nIYyBPKt4aY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UixPh58rc4JvXFXr4ObrMsRHgNZnOsKIHY/+147VVSSFbFS3q
	vZxPPwpvhKIyagavKdSDI5wYitEoF8zuJFe4kg52x7ftXRZpxjY0MWEN2JXIwtLuZVRnvNTCtHc
	Q/kYT4Mc4c04sIhznhA==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
