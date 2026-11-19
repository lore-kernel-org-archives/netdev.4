Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128050;
	b=G8zZCGAM2dw2QtHqGYN9gDQykmCoqChLKGwHTx2Zuzuf4675FCdGHOX3kpA71+Zb1U9w
	 XxpIs687HjS+iy/Uf6l5wuSjjpti6WSiN4SvCj7u3bazxtkCGC95Ev0t7MUXHkfcPAunG
	 HNgQ8U+ptw2XvbLX0p9pdib78S+K7sUiiQzLfHF4MgBTuBuQJ07W1kVrjeHcVSLDoRDlA
	 qxWn6wzTnZCvMo4QU1SWDJhvQPU1q2cZQI0f/B72OaXgjpZFsMvF6A0Veq3UdCo3Kz+VF
	 Y/vHIcQEOOIeruGYrrcNSOWZuikqHXnL/QGUaqhRKOXFu2tSRVuwiLId9hC9chpds1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KX9gw45Ko3F9cAwUcCFt48mDU8KoNsjYHRyjJHpt4Bc=;
	b=XzAZZpsRIQYV9uRY9Cq8sUh8PTy+JzLo5CIHGRIHhwIolXj66ua4VjgyYLYs/N9+BAs4
	 xkzsglwyvjfQh8+K9jBLp3Ge53bRAVaXMJg0VlFjRhNulxJLUnWLAlBqsa09VdYYFr6qe
	 29/Q834DJ4wKAX9rMZ89dBgchsCaNHIu/9EEbhg7aIDbYLW5FGEq7phXWT3d7n5EGS06R
	 CiGY0UCfMyzKgnfnOVzj9Kv5Y8rsqBr+5f48BhtcwMCDsgg+kfczShgyaUq6Lo8ac6rDA
	 VrYk5HV5fWhRFwcQnWaj/YJk/cUt0QFEHEtZP3cL9R35AAej/vpuW4/7Bo38Up2Nt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na+1krtj;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48210606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48210606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na+1krtj
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f01f296937so1935995ad.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795128049; x=1795732849; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KX9gw45Ko3F9cAwUcCFt48mDU8KoNsjYHRyjJHpt4Bc=;
        b=na+1krtjpl97nonC+fYj8Es1zVRSHZFi4IbHb4lhBhypuCekF9blk9Au8yUEMMyhp+
         91UE1d+FiU8OT017SDU1uYXndmYODI2IBUx06hyb7PN/8XolRV/H6i0hYbOf+P4nTASN
         dyyQs1F4l29D0mZ0pKvDF5r0qhSvSXxIupn/3CNNBekHhyT9KqjawODq/FkX7iBCo8UX
         TLrnOYOAw6rsQ2ANan2mwUiaL8YIyOmfeUIXvhizb0OnHIjn3t7KpgotYL9rgLi/N13F
         dOL3DEyfqGy7uKVu9p25dQIIX+ezcpyy8yIbqGUv4N6+ZmJHvN4347vMmqgMvJ6Lm0tZ
         VCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795128049; x=1795732849;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KX9gw45Ko3F9cAwUcCFt48mDU8KoNsjYHRyjJHpt4Bc=;
        b=EeIHfcUNnqHpsrt2NQqM80uvgWDiXk8wi5l7l6rxLDd+4jRUAbEkldcINdN0zDbeBM
         EO+YcDgCMfiNyRxlCn9AliCgGHZTRKglVcaxrx68S1+plxlS+NwX4YJ0YjGe24ji3v2Y
         ceqa7TuxYPsjYwq/rznGgcDkuSE75Pn9u/mVcn8Yig6+AdjNCDdLdglLVXGU/3dBQkU2
         M8JxzORQ0Wa/x4ndiMpeCtfPilAGvUcANaUcl/MlpSxmKiiLicKffoyAMPb403GZ9qX4
         86R0pAXxWm4MMDGSn6cdQj1nviTU0luL9sAFD2IbUxESbfH6/mNOVc49Rn2SsU8eEDRR
         K1HA==
X-Gm-Message-State: APuU4Z830lRh73j9IwjS8i3aEu7iNZoS2F0ZzAsam/fqX9HUjZsRqhzC
	d2NW/SN9VcciYERxOPpfQzhJz+qRqL47D88gh7UoioaG95h6SRMgg+04
X-Gm-Gg: AZFdTZfcBioUzJPuQq46v+Rw+4S9EG+BTJAS+dQL6dWE1g08MyxhRKayV7Qbh6t9TCu
	etx73nTRr9bTDqma1jV9gkAeUtXzvtgNMpt/D1aUmm1yppXONbUj1Rq3cyNFv0UVMieUJiYBrK0
	50jJAQB7xHjmChzNBIlIMntCDQaj8SCHTpkThWQK15nrjM5ku/SLlGNRSKv+qtOFoY2zkvrMUr1
	3wqhQQOlKjN2b+YKDglAzBGkb/kQQwjboJ1eDHULuvHWWVOehPN0SMO8azyx4jnQ0wpF3EpDM/O
	368w99snO9lDgZT9l6HlJU3fuCcqYAcf0LkxMN3ead1xyn1cyfO31I5/+jvskECSwj8nXYlHdG+
	+Rs0NQiJy5Qdod35UAbZOxNrWQC/HLo10pWM/+G+awArgOE7gg0f2VYBzqotjPYmBSj1qmEHx0Q
	6qhi8EqlAlXvVmwoDoTyf2w0z+seuIL0wQheqpQMHqsoENMT5sxV2AVZSZQeIyADNkoZtJdet/B
	QhgNviTIiwCTVUOQ66wk+troLOi3b3N9P4eSanXzk7YDmaK3F7XvHqhCfuQL0rYxKgnGwlqQ1U/
	r3vc6JR2lQ1kcjcPwwotiIHFM4oMWeNCq7dq65K9trLuoUMxmqNdvry1mSieZgdhXkZg02BxkQo
	BsMx18uKHeWDULDVVjzQAKysxEnFFeqxl2Q==
X-Received: by 2002:a17:903:228e:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2f03f1cfe41mr12272775ad.18.1795128049336;
        Thu, 19 Nov 2026 14:40:49 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm5251995ad.73.2026.11.19.14.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:40:48 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 22:40:48 +0000
Message-Id: <DMZJS8O5A4YX.9T2P4DT0DAB7@gmail.com>
Cc: <netdev@vger.kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <davem@davemloft.net>,
 <edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <bpf@vger.kernel.org>, <jiri@resnulli.us>,
 <victor@mojatatu.com>, <sashiko-bot@kernel.org>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when
 redirecting to an explicit nexthop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev-bot+sashiko@kernel.org>
In-Reply-To: <CAM0EoMkppFKECwmjw+E3tWpXEL3=cyg2VYhgpL+StaSiQf+WAQ@mail.gmail.com>
References: <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com> <179511856597.3136.7846835490904436138@kernel.org> <CAM0EoMkppFKECwmjw+E3tWpXEL3=cyg2VYhgpL+StaSiQf+WAQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 12:29 PM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> This is still under discussion with Alexei  - so:

Answering your earlier quesiton: 
yes, a route for A is acceptable on a frame that leaves B.
bpf_redirect() and mirred egress do that today.
__bpf_tx_skb() and tcf_mirred_to_dev() set skb->dev and keep the dst.
__dev_queue_xmit() drops the dst when B has IFF_XMIT_DST_RELEASE.

> I will consider this feedback if we have to resend the whole series or
> per Alexei's pov 1 or 2.

imo 2, 3 and 4 can go.

So pls consider adopting my earlier neigh_update_process_arp_queue() diff.

Need to think more about patch 1. It's probably ok on its own.

