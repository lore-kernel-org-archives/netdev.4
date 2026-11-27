Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739841;
	b=QbG5Cklm1nAAgy9OsyJBF/Wbmz5wf4PR8g3G8k7p98qaKhf8NclKNHXuhCy4hmMPjjc8
	 tivm8Ff0M08QRlElOCFaCTbiBBsyfCDh//EFIF9GqU144HhlYchWpi8cvS5KmEnvwhQm6
	 0vyziM879tYXKi9DIjVIMh8HjKzO2aHdLzVPo4isScBuXXg6v60/CD0XoeWY95PRwu+QO
	 ZpaRj3nBqzG7P7nJIg4YTBuWE96r7jr32pAUI/F7xEyJRnFlampAKFlk1ktMU+uCmOBiK
	 EmJlmEkbBqpoMKKIyElXdO8IcLR14Vj3x4GeLn4v4x6vxEsQSSNqc1l0iWO+2QSEt8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
	b=MD+uTrziS4nWaTEOo7Bu5YCO+UqFvX/X/86zTop1nGwD3qd/BJIV92m0/b3RL5RPfIgM
	 KImoojiPUJZ+GGrsICFszbJp5XFnDn4xaP6tYEDc6WJpVQD5KsLqtu0dbk9NE6/yJsosD
	 xJ75sXTPVOWyri5aHORapmZesWl7WgQxofjnAAG7e/SbHfhV4tKlnqfgLWWymhppzLf0q
	 LsrrnQo99WelvFQwlYYElHulUX/8biJ3z6CvfI/R68zbV5ks5zr4PWOfkqGs6Ajh8EOr7
	 hp0vvQL3IQOaCtsWXaAOU+BpDeHvAF6A0ZQ5eRbAyBjj3l3REpEkwyl+iDFv6yVaENw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RYi3Edqp;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69958606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69958606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RYi3Edqp
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644ab1f7bso66730021cf.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795739839; x=1796344639; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
        b=RYi3Edqp0iJYoWgnyFakqRlcBMM8VcDiE8d4VlY5bSzWrQs7C3jbXpEvdsf5xbs0HR
         k8SJFejOERTl3boet9eADaubxky0nrElyxMPXPWpVpP4P4sFBNoLT0vNQZStolAgoetA
         AVu2Mh8zCbpacWNyUVPHGl3RGM6A9CQHETQIX4aOfJBdNhGQef7KqYfIDR6ufufdP8LP
         5jHoiOvsTjxDjWW0L90H9rgfkvqlxNkDfm7h3cX67l/8MpA/9M1cz2dLCiNt8o5kr/5Q
         JdnVCeij4xVh62dHP4PJZYsGnouQAS5wg9J0Y6QCTQui72S1909B3CcTDDr25xXeCo8X
         2BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739839; x=1796344639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BYEpToCdu/Jrl7504w/3VIKWXqy3i8TunCn9olVHqm8=;
        b=pXQTkgXVxbmnswPVWEGp4DnEtS8qpI+XnQFVOAD5hpfGzIEE5RjPg7GJXWwVF2yvMi
         WXGC2ezloWtAUN9O6iKmfqfRDTu6B5YFf7iBEyteZ2TdgKq4iRM61yBukAtxvFPTgIXp
         Geg6ApvhLHQMGhGf1bUeA3H51pjHirAjMQHaV2cMuR79Qr64nD9Nwt60Oq3+ErxLdEqz
         gc/QyBeS1/9L0ejeKk2/4o0MxKc88LR9j59GAykFkqIeWLCwFXMHZfaz/Iz5inf9CS4T
         Tdh1C7EQ1CwjbpZfy1JwfGTl7MkohKy/blFpJSyha4DubD5FYb5JL8LPkAKCgfpBvx4t
         o9kg==
X-Forwarded-Encrypted: i=1; AL+hErEI/pbUNCUzGtwADHfUtanFRJgdPx7hlNgMtHBaLc30fQ4NXF7oGfkdqKWiqc+KxbBF9cHUX6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JDYFOw4redJaoMHKejwtoHBHM6yxZhGmjeKPefWVsGNXvQDn7
	dKiBSX5ME3wMCHWIr1UoSn1d/cuWFVmUFbaUp09EQseFv1o1cDQkXz8/DtzBC0s4TIk=
X-Gm-Gg: AZFdTZdaCAcp1hkF+c/RKtgDqka90kUYcZfRaQ/Q7U+56G8tF8UEr9CoVtkLszg8bf/
	lBlI0gE5ijgni29M9nGP4Y/xl7ecq0N3a35LqYrmII2Y9A6c14JXaYhsYdOmN8a3Jnx+s8XECFY
	WtGA2Dj1CLP4usHAtNtO31KyvQ2MS4VjExW2E7IwUVccg2aRKxQvRI4Nb5WmcojBY5hPge+6+JV
	+0Mvi7Ke75JCSKk2mCj7Ea+rGVH3ameuKF21FURSMDRN+X9nYxqSgKTf6Ave3iYoCpajHWvjdfV
	ZtKgfmQRFz0pa4Jlf85PoqdiKeK1n8kJ6K5IScm4Ttm9HrcOgqVP5QBqdqwXnv6jyU4OM+ZiOi6
	4xl70SAS9+OyHgiP76f7AJxCRb6RL2Eksphz4uQvCpHmblIu4au4/LBo9uDnyDi4cSjKH78j/xe
	1o02IVntyhJIPNwIA7gI8kHmxPcFudLiMyjbcAu/uIEEPbldQ9oi+Tl2VxRju9fKhnpj32jmULg
	qovwxaZ58H7JnoB5e5fBum9332fgYAwV9LYCFtud/RPEsEkFKRYdI/h1zzmj1hi521rl2DhjrGH
	iK9ruA==
X-Received: by 2002:a05:622a:1f13:b0:533:8900:4eae with SMTP id d75a77b69052e-55d76a168d0mr403124891cf.13.1795739839275;
        Thu, 26 Nov 2026 16:37:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm192115611cf.17.2026.11.26.16.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:37:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWjxm-00000005OdJ-0d4j;
	Thu, 26 Nov 2026 20:37:18 -0400
Date: Thu, 26 Nov 2026 20:37:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com,
	treding@nvidia.com, jhubbard@nvidia.com, chaitanyak@nvidia.com,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
Message-ID: <20261127003718.GR246011@ziepe.ca>
References: <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
 <20261124194618.GC114530@ziepe.ca>
 <awZ_Os1pXelOGaFP@nvdebian.thelocal>
 <fb9a6b12-c134-4e40-86a5-dbcb59c0b91b@amd.com>
 <20261125155559.GL246011@ziepe.ca>
 <5fb8bb60-7d9f-49b1-899c-40a890fdc14b@amd.com>
 <20261125190705.GN246011@ziepe.ca>
 <awfMy1d8ICL6mr9i@nvdebian.thelocal>
 <a8c00bbf-dddb-4207-bcdf-af58d27116c5@amd.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8c00bbf-dddb-4207-bcdf-af58d27116c5@amd.com>

On Thu, Nov 26, 2026 at 10:58:13AM +0100, Christian König wrote:
> Would it help if have a call on Teams or similar services to discuss the whole thing?
> 
> That might be easier and especially faster than by mail.

I think that is a good idea, I suggest you and Alistair should pick a
time and see who else can come. From experience eu/au/eastern na
doesn't jive :)

Jason
