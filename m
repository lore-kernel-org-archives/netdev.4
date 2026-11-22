Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358315;
	b=j3bxdf8qouQYr9ED/2VyCU7l1Lq0ZnESKzEhrn19JU/AEGHH9f8S3sgJ/GPqSU6edg4c
	 GWgQfdAOxXWrb+B2JH9h1f2S50a3q7WEOmmbGcid40GkbpVTe0ECBUzOMVPQEQ4T2YfVv
	 bLTSoid1LUri4ncT2wBSEoqIulkx/hHZE9BEnQt/nSQf0QCS7LN+ZJ9+tOxRBAdyNUN+w
	 pn6XKx/9uhx7ZAwl+DMrlHEpMblI1+hV6Cvtk3koUGVq5VZH4JiJU2/XvFY6AK7g+6vEf
	 8GCZ8i4bDhlloQw/4XKnPS6cS51IWvWlPJFYUOKJ/Ko/uXoyK9Cyg6mjDWziiQ0zgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
	b=BuBYHxMj5NbtEuyTpGQJwunCrJuZA+OnlAak0p1gi21IaVYCBp22Ts7kPJd6OfsLYkGJ
	 /KXwPGb4XP0ho1+V2ViglPOi+H60XBXIhf+mfZz1VZazqabElWMJuUH2dOm3te+GtkHQG
	 vkn7JFyniKCPrjW0xSBEX/WvgqF56t37nAHKPhsFUYAJ+p/MnuYIomRgBZxPd0yzpt4Ml
	 CmcaV7ixFxa2WpCBiIf2ee8pEHZPNpPTILzcv5ydqd4kLPrJzbFCbE6ekKQkO73tAk0Hm
	 E8HEt/grGMQCIShvS9+G/5wYocq8/OY1CBNGhU3xWcWX2mSBaCTtE373dFq6smkSTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=AfkFgl4A;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FBA606A338
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FBA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=AfkFgl4A
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92125687442so24339086d6.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795358314; x=1795963114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
        b=AfkFgl4AHUA11Cz2zk8WBBwMK+X/HIDzRK5+MYdyi2ng/C7wpuCEEaLWnoeurwqvhc
         un8Y9P/KDffzAn5QBJDeL95Aonms5uE7VqyjYxlDXnsQ9+vnFoScbxVFG7Dr/LMkHOCp
         YipueMC5yBS8tK17Sc3TAIfKjE6glUoTJx3lJbFarCR4x9CstDkU6KBjnKZ5ECcdXJd7
         rfX77s4AmQcKf+/3t7duDnQDJEudfPbSV1EUFq5u7GTJj3K8Hfuoq2MM5UZFPpsvLmsS
         z8Eiy9QQJzDIkaBR72BN3SlcRBurKtzYxdgpoEgVrs17Nz+Iy/+xd8YUONSHPtLaM/3i
         QTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358314; x=1795963114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+lBzUtZbcPnxrRlj2a5ONA5sbQ6rA0NyyUMApXQnAc=;
        b=qCjNv3gycvYn1xnQMbTZzxIUvtVLe6DjSY5nj7cLzpsW6Otl7uIcdTc2r/RfakH4Pl
         Pxvwtpj49QClZEAQrlTJMWgOMD9+HdN9A7V4OqGgrHZ5ElE2wdfme6xv+0c0BGVM2RY+
         HLYkLH5FdzDKUk75x8d45ewGFIZTbIFlybXPdw8mK97kzlSfaMa95lxIiUy9D98naix7
         m9LfEYDKB0Ahn0N0o8OfqSBdDNB+pMJ3/lS5fKsWq5X9kHvwCAs5Dp++YimByt3kNGVT
         D3jx++AWptgM21NGxU6Su5eA32ATFSB96vBWdZNqzMpF6FVFWHepirIoYpwhNdWQWySl
         g0zg==
X-Forwarded-Encrypted: i=1; AL+hErFoX+9GkzSktN+MSjTpVJHhUU6n/BdvIh4+GR4oefqPKuWZ5gzp0Z3Fk9ss1kjyhxAr8f76Tp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p7EtBLfzWzDKNbMMVAg5Df/B5WYaddjeTeEYsd7OScXXk56rS
	ymbZwIQ4Ggwjx7mE3m/1ZW9xF04gdZFUtZ1vYcD8S1iQIJGy1jsNKp0AWCBpeZUjqg==
X-Gm-Gg: AZFdTZcbu3adDNOQUpTiXMav/JBmIroiJDbCA+tlbDGpiz35nkKBj2kZa9mljCx/K8Z
	td9lUFEsw1tjVvbgj397s+hNCUdH3/Kg8lwSUxI1xkpv3aO1//T3R7ox29JbIXwBiY5EVpDKXFn
	nthnSI61Tiy9NuYQYM2C0ccfP+Ha9LV8G6fUgK2fqz//Cac9Ly8nhbhLqHlZHqAj7ffEN14jNE9
	rFg2lCI7kLiwyv0bG8XXVhheGSjWFfM7d6+2zl2gYTWJ7vMG8mur/rNFPt5+ciHV+haXJD1ubjE
	+hxwCl8f1qfWqItbgVPoEeDrH0qSBq6rh0Ai8HPSwv1QTg7Fg3puedqNhNhK7TqPRiDg2ZLJ6LP
	M6jPH5XfbBacphMkjCYIOQ9hFwMmm4UIdfghXSxtSX8EnAQU9pXH4Kalhf1yi2RxIqe7wAASBhJ
	DjlYJ2hiQpcaD5TkC0kWyYOcnoekLSZGuSoOBSNeedr/h6tUzKLcbBMAy+4QM2bNC39qg5wnldM
	YmpG2PFDWmbL1Zl7X0Pc56S7SG+feUZcrAraix2AI0wKsE4kuHNMNQcSY+5vpFczeeGQPBR7vAx
	TsQApgTU3CC8xR5Icc2c8RfdTJN911tBDEy1TE7xY1cw9pTPCUj9
X-Received: by 2002:a05:6214:5015:b0:921:8d9:7f8e with SMTP id 6a1803df08f44-92134a6ded7mr155188986d6.12.1795358313858;
        Sun, 22 Nov 2026 06:38:33 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm79665516d6.39.2026.11.22.06.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:38:33 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Date: Sun, 22 Nov 2026 09:38:29 -0500
Message-ID: <20261122143829.2674252-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122092235-mutt-send-email-mst@kernel.org>
References: <20261122092235-mutt-send-email-mst@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 22, 2026 at 09:25:37AM -0500, Michael S. Tsirkin wrote:
> this is followed by:
>
>                 virtio_features_zero(all_features);
>                 argp += sizeof(u64);
>                 copied = min(count, (u64)VIRTIO_FEATURES_U64S);
>                 if (copy_from_user(all_features, argp, copied * sizeof(u64)))
>                         return -EFAULT;
>
> copies at most 8 bytes.
>
>
> did you test that this patch actually helps anything?

That first copy is bounded, yes. The unbounded part is the loop right
after it, which is outside the diff context:

		for (i = copied; i < count; ++i) {
			if (copy_from_user(&features, featurep + 1 + i,
					   sizeof(features)))
				return -EFAULT;
			if (features)
				return -EOPNOTSUPP;
		}

It reads one u64 per iteration up to the count from user space. With
count = U64_MAX and a large zero-filled mapping, it only stops at the
first unreadable address.

Yes, I tested it, on the vhost tree at 44293796526f (KASAN + lockdep),
count = U64_MAX:

  1 GiB zero-filled mapping:
    without the patch: EFAULT after 27.4 s
    with the patch:    E2BIG at once

  2 GiB mapping, SIGKILL sent 1 s into the ioctl:
    without the patch: the process is reaped 46.7 s after the kill
    with the patch:    the ioctl has already returned

I have a small reproducer (a few lines of C). Since I found this with
the help of an LLM, Documentation/process/security-bugs.rst asks me to
treat it as public and not post the reproducer to a public list, so I
have not included it here. I am happy to send it to you off-list if it
would help.

Thanks,
Hengyu
