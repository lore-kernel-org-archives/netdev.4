Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622150;
	b=vNuNXCSp2YTpOXRstxkov9v2YZrC16trXs5/RXFYo4GMlA1GrReu8YFd4v3kDxACNZ2C
	 YUnINDqYBcGI6v+jYATamzABVzCXg0YtjDSf4AWlmrr5eUKBrUMVDV5+0jFT4DbcIkCL6
	 Gputf/CCCblqJoQv9l5bDOAc19YJtVdxwqDtuQKKjps82lWVNnX65BHWF1EgnaF6s7dod
	 CjzDWQ6g4uERtkL5MlTVer8LGfZQUju5S4n91L0TiN0d0GUs+I8IcgHQEdSR9lHNsO0fH
	 Nk53n6BsyVEHy8aP7X/iWLg9I+mkt3VVIdLLXCbvxLZ93bK1Gw9ZOXpcjiu6Kp/kLEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
	b=pVGrylLdBV8klk2VeSuqg7rFFzD0OsObToiWYQAMOVYsbIbzB9SSNkiP7quGR3LZ6xVM
	 YebmBYrIOeFpp5ugfijtgRwJKzNm+wkUbBdWQzZiosj9Ye/2Z7aio6ldEqtlxLBAGtdOF
	 +Uu9xi/uLznx/ZTHJgYZFsN/WG6skHKh3rtOfiNXWmO3cuXevPGUbJoa+jWCayfxWVU4l
	 WeMxxTRBxj9Y9GVuEW3BZHeHFWSD89cisLOxX+6zik1oXYTNKR+eas0PUCbiJBVR89v4a
	 +M4TZgstfz06lxb3/KnwSLOL2cciUuxOZhuIFk7VnYUMGNVhvqvJeY0/joJLfKFA+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRmswUYD;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC89606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC89606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRmswUYD
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05b465cd1so31854715ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622149; x=1796226949; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
        b=mRmswUYDOkXq/UziIC13mqJB/DpdkOjrfmfYfcE2DAU2RI9p2xatCmdzYVlzCxFXja
         3JYbqhecdSF+xjfKruqW8sYO8X/ibagikGy4g95fhyVGBsAndAhQHpAye1kEtv7eO1pK
         KyGHIWFAtOhC77EyuTjrj4u8v6VXPq5mn90QGikJJcO6qf/zklMKfWp0f0lVd0OeDEAk
         ufQ/Qr0IylwHABzvmm5Ara8OVrGE/hi5lhGMPbvxrH1NdMb1i1gA/dKS+oMK5M/+AOam
         GHB2Z8PqHLIaKJ2sO6IyDtwwxy1Uj/8Ay+DZ6JEY5KAmxsyL8fgSD8efROoSNpinZm4D
         +DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622149; x=1796226949;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
        b=Azmirl5q522gMlZlne7wIwsm9P4mWDdvcwaZIruDdVGfAxM2/toZN14qpVJSrfbYY2
         QrZnNB1af98ZIbsAMbbNVEMdyNvKZcUMVYzTXLe8nZvgj6LCvf2aLncTjO4hQ8b+3+Kx
         LW0jVR+LmOdiNI0FUdw7mtdTZ1oKZbjnMRYQZl+agSyXeDT8ooGnoKixyAa/CFXqPta5
         MmRuE+KjkMQCONm35eYddXQ4v3gp3fPVxAXEg8NwZIIm7BJyTQr0SGq1Jcv7LA73wMhb
         wVbrjq7vpNartxRKjGcURQ1pJytW3b1xboXuUpTBh7XZq4D0NYKeErqDRAV37EVvVv08
         uLCA==
X-Forwarded-Encrypted: i=1; AL+hErGVpxXknbYWoM691HifAFCxdOm242Hq9g85QeEcYjyG9eSRFaoC2lhRebIqWoseZPNp83abqcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BaDqy5Ux2NwtB4bYSBsr4bofxbouDFfQv1IlFHfVEeQMEX/vP
	zZDGOeNuxoaRQLWifUWjOk2nPcfOnidFjeKOetA2FJI1ayxaHCYmqc3V
X-Gm-Gg: AZFdTZfb7WJsMOyp+/j7BzoYOcDMbM9gtMFsPvVrVEdVWJDZjTGdsqPemJg6poAVKSV
	fLfbXU0A9Gm5h7gMFQQG4ylMswkoAlmPRKI2p31InQfKK/Yc2Ns+XpN61wQpACVCFmClEAC6g1E
	Ok8PWOJsUgvEJGlWfgu2I6XK6qD+5HO0ZLO6lvlyhqNZJYbVUlqQ+uUIO4MXkoV99MbRbWaeNRi
	cWWt04WaZO0pNwsiIjHeafKP6wFID5dvBqkKDnGjdv4aHVt9tzkPEYCjZ8z5ygy4ecYN4WTQcex
	rdwckwalgdxehLp7ZExkaZg2Qf1Azll8BMyLjp+81RF4GhW4cxW8YMxzcjF563b+bErMdcKXIYx
	mjsPngSVbrkK/bNPbE9Tk9WFbv4jF7RNxKRi4iMz6KFZdP8DCa0FZ9CW3v1QomapC5TSLZU3Mya
	r8F1P6EZ8i5AkoFdKL+6VribH3r3D2XWotuA2RphvTrFFgF1PIFKEcUlb92si5A/XVHQsf5YVKH
	8hi9gMalgIENx7TapNE+c0lGVe3FIo9GQnH/nPPIL6wa9JsnNPzyZG87P+ABc3eRJ/gxhU=
X-Received: by 2002:a17:903:b4b:b0:2ef:da34:7575 with SMTP id d9443c01a7336-2f03f1b6c4dmr174930345ad.69.1795622149288;
        Wed, 25 Nov 2026 07:55:49 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm87875575ad.71.2026.11.25.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:48 -0800 (PST)
Date: Wed, 25 Nov 2026 07:55:48 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>
Subject: Re: [PATCH net] tipc: drop discovery messages shorter than the fields
 they carry
In-Reply-To: =?utf-8?q?=3CAM7P189MB1137AEF136434E219D4075C3C6432=40AM7P189MB?=
 =?utf-8?q?1137=2EEURP189=2EPROD=2EOUTLOOK=2ECOM=3E?=
References: <179550610427.774194.2378040347436778640@gmail.com> =?utf-8?q??=
 =?utf-8?q?=3CAM7P189MB1137AEF136434E219D4075C3C6432=40AM7P189MB1137=2EEURP1?=
 =?utf-8?q?89=2EPROD=2EOUTLOOK=2ECOM=3E?=
Message-ID: <179562208894.3410737.11139865919662209546@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Tung,

On Wed, Nov 25, 2026 at 09:44:59AM +0000, Tung Quang Nguyen wrote:
> Discovery message's  header size (MAX_H_SIZE == 60) is stated in tipc_disc_init_msg() and it is a protocol message.
> How can the peer send a discovery message with a 24-byte header ?

A TIPC node cannot. Anyone who can reach the bearer can, though: the
message in our test is built by hand and sent as a plain UDP datagram
to the bearer's port, with no TIPC node involved.

> As sashiko pointed out, the lecacy node (before commit 948fa2d115c5 ("tipc: increase size of tipc discovery
> messages") sends 40-byte header. The above check will drop that discovery message. This breaks our compatibility rule.

Since forged discovery messages are outside TIPC's model, I'll drop
this patch.

Thanks,
Kyuwon
