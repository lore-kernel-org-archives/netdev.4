Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505162;
	b=DrNXAiVXmT/1uZIxryg68TrBJ6MWmB0mgF+yR/KIgWyciUegT8DEWOfKHpiX2T4TOYJB
	 J77I2qAeI2lwrGnQQ/XsDBy79vDgoguhi94/ovvsN/I+ul69zrDgbdBdxm0Uz0zjYF51F
	 Ak0JedbUHhPAfMWPm+8B8rtjSYxTFQY4lQi26E1irRitSAWUUPrs4mKx68OlfQFtGHT9S
	 3vVNf/zO51L+bvlKdQvNtFHFkL7IJCzrkCnHsdker+wTFxEVHzuQK6/tMSTl0C3q9w9TL
	 /xMMXIL8CYsGiPmH15WhtYc+jeWGRQl1BMxy37gQdir/kZu/QKsakS7lbsYakqn7n0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
	b=ffs1F+L6oKrdDtcjFRgu8lHMYil+NCto0gVjZ9Uok0tLGwedE+dcymJ2TJxoGHajohTu
	 skFZCEEzg/J68/TN8yR8BIO5zi1RABS2YR2s9jLFgQYdfVOQFu0DlNdpCpeapcO59kxil
	 JD94YUFr7QOw19sfvoRTNeciwtKx/2oZAWTouI3wZUjLbRJiDE2on57+BUEecQppcOGaa
	 pdnsa5OwTVx6zJfml3lnDaHs4Tb9Sghi8Z/nvnKPq5CdClu/wwErl+npTlccKXTnlbX8l
	 N/xoudw4DNf7/TyyiaXQiRcUO/KXiwatiJn1kKjzP/G6TIldotcrWMiN190kzqO/k0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="S/Smj6gw";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA4606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=S/Smj6gw
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so4829747c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795505161; x=1796109961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
        b=S/Smj6gweouoG95p7UsC5L9Rx326jh0jEK9gkCokZYGvxdANcb0jbpcviSVVuh+H6A
         4371MTqFT/jUvbR/Z8Tcx6roSTVrzfF75Tm5uMLkzi8qyBrEMQVt/NvknLxk51SuVVa+
         sE1F6Dbanul6jDvIlLeAy4t8p0O1wCMUXNxs47k0MxUPbJt0YRU0NK/eGpsmWRgO5v7V
         IHSujl5P0chvXtfr+4FoXvqxIvQTklqVHZ8p35Tkvn6NdtC/uGme9ZSZlJKP05mg1IO4
         xosJ3Mwn9AsibhfRhFM9ZxhyG6LA6Z5JzTYt8if9BrFw3kpOVlBjwVBUBKxYYJ2oXM7J
         OJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505161; x=1796109961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
        b=L6D5q+q5kg8hlnlSQH3npGoIObg1TR3tEnm9hFTweQ0gxi/vrE1bvF9bUoz+RweF4C
         3tvM/FcBAL2PPQG/9LuoP4S9s9n7XizetAot+TFaeBKH91QdBZEBpvFSFTkmBx/HHtmV
         +57a4h9XFd806StFjWiX0htIKGsn274HgkLmA5TaaJsX/UizsKI57MefJiEXqOdv2K36
         zSCvYRJscu105RcK9xxwrdgPw63FZO5/HM/CXksypafQNGIkaFpvRyKrNcGis9UKWzMb
         b1FbqHqCkRupDHO13R8I2o36F5+wscXnWd6WWnm2MXVHy+QjNuXgUDGUNyr/MKQ4OBWA
         sfHw==
X-Forwarded-Encrypted: i=1; AL+hErEpfUoqlewi/LV14cBKUVKU72D7TEEYP8K8Fs4WwbPvq+sAo8wMnc3QL7mKPdDRANg/t+DkDhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pZU3mJsOvSj1w/aYE7qEAdepCWADae1SRBz6UgaQYsJBhlMM6
	OFErVzNqSNEpb98YPmBrN6F7iRBj/edAioDPglYk9rvqeMtaTScb/hmSsMKwnQs3snM=
X-Gm-Gg: AZFdTZd0C9pqu3idZ/ve0yjpl6+o3ufSsndboEsBzwknfnuRslCr+ncTLf2K3ERUHFN
	lHIyR8kzyVhHMmXqT5rrHlktjovY2uL/t7063cU3lFkFAIrZ35/QJJH3jbXRjMxrFqVNbvywxJf
	nZHxx6JAq+Tj34j4UDAfD+UtXRFVz8YnZjqJ3WKyYoOWSc/aMtsjqYuNBLtE2RhdwDPXo1pmj3W
	6dw/V2fGXzs9vGx3qXWQDUBW0ggZXAu7W1lk9gqdwe7x7dk+pYzwa/WMA9UOfYBQPYWUemtFp8w
	Vs0YlxndcvJ80XamzDvtuGue2IJM1bGcax1ZSPH1MWZUvasfI5nz40TAfZ4iLL3KGnkNJ7YzS7q
	j2v0i1CHeNVyTPMcZg5m8tT/whON3K3lV/feQYDGiucCPKMWcmNz/HB6yClvFdirNA0GB0RkZ84
	XN0+X0JFonmSp0EXBnRwVeZaFZqNEq5vk8VWNSHpIApv13/cGwpzmEX/qd4XnoAyUkpTrabi4Ms
	IRv7S8IsAJBVvsOnjMTqpvqoaAhEloCth9kIaU/D6bUi6ExtpYSR+RzI2gNsY/QluZqsCRJRqkg
	bC7lk2WuvqbNsbkiLhaCXJx8H9Dr4wyIOOccSMXgnmu1owFtFUuNhZV33h4vVTm7BtYNrCe/sL3
	abm+E9ocY1e+nqOZxEXrSt8/wVLrad8HyM+fLVqjV0RlO+EkavHs=
X-Received: by 2002:a05:701b:2088:10b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b5568d349fmr14493980c88.29.1795505161121;
        Mon, 23 Nov 2026 23:26:01 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm33037003c88.1.2026.11.23.23.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:26:00 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v3 3/3] amt: make the per-tunnel group and source limits configurable
Date: Tue, 24 Nov 2026 07:25:56 +0000
Message-ID: <20261124072558.846669-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179547826432.3135.16263442399696125291@kernel.org>
References: <20261122235724.2898320-4-omar@blockcast.net> <179547826432.3135.16263442399696125291@kernel.org>
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

On Mon, 23 Nov 2026 23:57:44 +0000, netdev-bot+sashiko@kernel.org wrote:
> Do these new ceilings also raise the per-packet work a remote gateway can
> cause under tunnel->lock by roughly 32x?

Yes. At 512 groups and 4096 sources the budget of 2/3 allowed 3,850,240
bucket and source visits per Update, 32 times the 120,320 at the
defaults, and the caps were argued from memory only.

v4 caps the budget at what one report as large as the device's MTU can
cost: a host splits its report to the MTU, so a report names at most
mtu / 8 groups. On a 1500-byte stream link (relay MTU 1460) that is
416,256 visits at the ceilings, 3.5 times the default; the largest
legitimate report there costs about 348,000. The defaults keep the 120,320. A report
larger than the relay's own MTU, from a gateway on a jumbo link to a
relay on a standard one, has the records past the bound ignored at high
limits; the commit message says so.

Measured in a UML guest (KASAN off, so only the ratio means anything),
v3 and v4 booted alternately on one machine, at the ceilings: the
report you describe, ~7,500 empty records naming one group that holds
4,096 sources, takes 8.2-8.9 ms in v3 and 1.3-1.6 ms in v4 on a
1500-byte stream link (119 records applied against 13), and 5.3-5.7 ms
with the stream link at 65535. A full refresh is not slower.

Teardown at the ceilings walks 512 * 256 bucket heads in v4, once per
tunnel.

> With hash_buckets at AMT_HSIZE_MAX, do the per-group and per-tunnel
> allocations end up just over 4 KiB?

Yes. v4 keeps hash_buckets at AMT_HSIZE (256): pahole gives 200 bytes
for amt_group_node and 168 for amt_tunnel_list, so with 256 heads both
stay in kmalloc-4k. At 4096 sources in one group a chain averages 16
entries, which only makes a lookup longer. One tunnel at the ceilings
then holds about 2 MiB of group nodes and 0.75 MiB of source nodes, and
max_tunnels multiplies that; v4's comment on the caps says so instead
of "a few MiB".

I will send v4.

pw-bot: cr

-- 
Omar
