Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706227;
	b=nO/8UQaOALlZDPR9e16p8iunyD02P5MXJRhj6VVx0ydMU/+wpKtZn4QcXR1DKknc+thr
	 8P6qWLKwvwHP7lu/THWPhD8hGGe3aiznaRCbnWiADNXChdfYX4xnQWeKLHajCxLuGpEWc
	 l2JZqdq1zC8b6A5Sq9iZVv/rHWvhNx0bEgfP5GrhQdUvjW3NVAMYqA2dXiMaXNmQLxczc
	 3gFt7duTLkq6ePBj4mN2iVjSuDrjcxmbbQpG8UBFhE0eDFZThHx42RxkMkHonVd14l8xC
	 c6ZyW356SenH+Fp5S/xaMZRMoY7GsdQByQfc+Bia0vMYeIC/4bhDz4hfyOROA/ofnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tgtlx4NMqS10ms61luKx47rdjQPmLcLUwVEPmpsB7nw=;
	b=YYK3urKRazzOxJPoc0P2xAhwNoSEXk2UHZgkv1fXqItDKFBSEtw7MRaOCcm9mU3aGTiT
	 VS0USa0L4EQUuaU4aMHcU/ck382PnZ44A623J7Ee/oRcMQ6vaFOhgXzmi2kt+EXVGJCBd
	 Facp0OoWsv3+GftZD0+5TXGF/YAGKR/pGENHgakbV6qzHv1kJXvl9lrDhrGgF71YK4scK
	 +0ApQsCw0xw5coBUoEQj5v9DR1p+G9h+bLe11bqqiVhgGQb1qUlRlPe0mfHtghaD+BHx+
	 AIS3Zyuq/fk95kX/fzeC1iTMimx+yVMPMlf65Kx/bfGE7a8npSA8mvhmTMRK/a8wbog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Lgj8JxzH;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A8606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Lgj8JxzH
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d2f5f1e26so77474541cf.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795706226; x=1796311026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgtlx4NMqS10ms61luKx47rdjQPmLcLUwVEPmpsB7nw=;
        b=Lgj8JxzHME6WRyO42EXjOwFqtXShGWOSbbZUOSElpVywVH//VHeT+b/D+kkHM0j6vi
         tzjKM5iLJeKDtyO5UXXIC3iLflw1Q79Uh2ZB5YhXzn7W5XRfwDB9ZEuZ+tdHNlQbn/a9
         BildDDxbCkxIOCmWxTCeaSK/UetRr3GrHrwJGxIczcmxr8OTSPd9+9gOFOOyIJ2TZaRx
         5h98xhXnzh2+zkXKEbiNhE+VHKAX2sAkEOzD9q3H7aJPbOgS+8tB0U9gmfvWtFx0sU1O
         tykhLDuJ96m5PRgtQhn3zn9lBD8PFZ+5XTV4oLntTbE/bNu6gPOSXmNoBymwrX81wRmx
         jKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706226; x=1796311026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgtlx4NMqS10ms61luKx47rdjQPmLcLUwVEPmpsB7nw=;
        b=Gtdtmxhg8HhZA2iTzVE5vEA2AlCi2TBJRk5/SVurfZIZkAjq+ZpG7K9F71dbuby9Qg
         7yhDCWQdkHaFzGs8sWmniBF+gr4naFuypdyTMJzIm0YvRIt4nhZJEKmRxmXoyuKrGdd8
         bGz1MRIqjvEJ0GJL8LnIt2Fj/uUk3I9mNxR3MLE92yPuoPfr08YGCqwLUvj2pvToVD/l
         71vvVQ7v8ayEn3h3gPcsSl2c+1LMUjLl1yok8pZ3M8dLxzzAcaDIF5jaiNFW+wXRhxN2
         /k5caqlJjOFB1jJ2WZ3JwhctuPCWtYJFPmS5YBSseAJyxflioU8NH0JoDe4yhPjdoqP4
         LuXQ==
X-Forwarded-Encrypted: i=1; AL+hErFyvnDAMVIH2DVvashh8XQ072nhynE9P3fDQaoiAmEpqIE0w9oqGWXlXJLN3ry+Yl+rrCM2fpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B5gv5CFo+NLoRYtv9q0MmKx2krKotLuCc5PoFqzbRnxvPlY70
	k4xD1v1jx9io01Y4KHzVl3yPaWGAhMN2cltMFukXEVfmAA0CkQk5oxNvq0SWwmxL4ySeF0EMg7n
	jbZ6z
X-Gm-Gg: AZFdTZdjNEmxjBfy55JRdUAchX+d9X+/aMCVqYJ/J8GDMLQgn33PM8Skf2oWUHChwIm
	mLGK5bg7BINNkKWk63zs5fbWUNknNruyWmtDcNQ5HOR1iR84Qv2mKVjh3oFeXEKa1I4ADH3ynvB
	TWU8xKEG482DYPU/6p0xDg42LEDbrc/TH+JlesdEwRmGYef2feUT2bFpr2iNCe+7M7cRT4qnvhm
	onynSxBwxLljN+Mftn38zRUKem480ipN5XjGzBcIo3QqRZBXLlwkUBNcpk4UaQHtQ50ETA7HLxv
	htllX7PiewkKt0H/nM8KEGxbUXgRlCzKfItOtXA9HLIGLz0lrjDE3rJCGBjRu6Rxgs1C2s6Q2yZ
	PHCph554o/WaUbxwdgjUWnm9EbycoBqOQ/Jo8VfYKs5Q5FGKxnomgXYaqhyPwAWmsR6fc2yMgkb
	/l2w5y03oVVz65AVFxMBHJQz+rJ58b/WNuQzEooFqTeMNIWGPBh0IncaN94g70lCxHirI9u0Fii
	ZbIhEY5JmwDjiSygNNA344iXSgMXWpSW1sMuPltaG966yZmSGQRT3/I647hyjPBwEKXxKruFki4
	d72J5A==
X-Received: by 2002:a05:622a:60e:b0:55d:324a:8207 with SMTP id d75a77b69052e-55d76a4f23cmr396621371cf.29.1795706226390;
        Thu, 26 Nov 2026 07:17:06 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895beesm6928491cf.11.2026.11.26.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:17:05 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWbDd-00000004Ns4-1bDr;
	Thu, 26 Nov 2026 11:17:05 -0400
Date: Thu, 26 Nov 2026 11:17:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	dtatulea@nvidia.com, moshe@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V2 rdma-next 21/21] RDMA/core: Report and enforce
 adversarial mode via GET_CONTEXT
Message-ID: <20261126151705.GP246011@ziepe.ca>
References: <761ca80e-a772-41f3-b8e9-cc332e4ba5d9@nvidia.com>
 <20261124125327.GR14811@unreal>
 <20261124125950.GC9566@ziepe.ca>
 <20261124133353.GT14811@unreal>
 <20261124134751.GJ9566@ziepe.ca>
 <20261124140906.GU14811@unreal>
 <20261124143024.GO9566@ziepe.ca>
 <20261125090309.GY14811@unreal>
 <20261125144521.GI246011@ziepe.ca>
 <20261126140511.GP774860@unreal>
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
In-Reply-To: <20261126140511.GP774860@unreal>

On Thu, Nov 26, 2026 at 04:05:11PM +0200, Leon Romanovsky wrote:

> > > > It is not a security mechanism to hard guarantee that rdma-core has no
> > > > bugs.
> > > 
> > > It is you who talked about "... security downgrade ...".
> > 
> > Yes, in that I want people using normal software to have a safer more
> > secure experience. Meaning you need supporting rdma-core if the kernel
> > is in adversarial mode, because otherwise you don't get the right
> > security outcome.
> > 
> > You took it to some absurd scenario of a user hacking their rdma-core
> > to defeat the check, which is not the point at all.
> 
> No. I'm evaluating each newly added UAPI field passed from userspace to
> determine whether the kernel needs it. In this case, it does not. The
> kernel will behave EXACTLY the same with or without this flag.

Not at all, the kernel will accept an old rdma-core that should not be
used in this mode instead of rejecting it. That is not "Exactly" the
same and is the behavior this is all intended to create.

It is simple version negotiation and since this is security related we
do need to do a minimum to help users.

Jason
