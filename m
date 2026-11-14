Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682230;
	b=J+8rAQNFEu8aELb1/VooLIZj8STIxVWRkGVVeCEGgTRj2HwqgDqIx6xYmFDuMGvA3qDA
	 iqca9uNVXj3I0uUO7OlqXvq7wwnbr1NsVPTcAdFyGcc1u5WEc9Va+w0KAA/vXihWoSaUr
	 JX+yNa4HabDx9ujl+Kwu6v1G/jXu0XvLdRzOIZtCPhfglFrhUGua00I4RIBlNPGgkZkUl
	 bHddv4nLtVlVwaH3Xxekn5Hg63ZBm5G3stw9AHc6jSZ0h57YJa6pWVpoAtnIA2nH71wUU
	 RaJNgc1uoTp0XoD+rF3n2DrlBlpTFdmoSeguzQkfVhsOyXdy4M9UactfA5f2UC50hDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
	b=pfK+PWdR3ErMib+dhTpf9YpizE+ycYkOAGjsUbfQRYayV22SuPNdh6dpN8U2grgIDdga
	 3TFdgw83bzKuXvr6IZt7hHXpT05bnEf016Xc/pJXrf9qhtKvd+VRvVPO+0q4lBKUelnJc
	 M+BUwUW3eL+nkbnaQLr0p+ib+Cj8gNJZC4sIWI3lXBARH2RSLOnAeOdq0xsIOSGMDReVX
	 VsJ8QM1h6QQAY1wZykuxp2MpKe/sGT+dCITfnpnrnLMIH0yGrsDUzzYm/eb+2gss6VyPB
	 6/DbshTn2hLXsrHPmotAfFPTh1Z4tU+oTcyBQblVa7zNv8+cxzsBnO51oW7XQ2ZJ1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GLhZMEfG;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA01606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA01606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GLhZMEfG
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed2b4348fcso7260925ad.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682229; x=1795287029; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
        b=GLhZMEfGifRuC596AndpNsLBIA9hBtwq3Fl2rl3RpCiUBa8JAgBi68PRu+6UvL0g+9
         Xzpu5p86rL78arrOM1QXBYNA9uv/mQu8WneFiAYdgeLD3BArt1DXcWip0vvdIfwC1ddG
         0N7V1Ecf+4SbVcB6y4tQNetroGzQmR9Z6fFcA0F6Ilqp1eKHvae2lq5iaUBEk0SCv3fZ
         JsSK0yuswuP9WHl5IzYpDImD+QbhCfQvlc2i+GAF3wnXupHdatzhSaYbY7MO1Gbgv/tJ
         /1lWvvJ7uBAc0QGCLV5ij/aoOAMBqbIa9aK22/g81KNbLj5WqLzMp41HokYHr0zzbrFb
         IZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682229; x=1795287029;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
        b=emv9ufvPUa37q5STDly/SuK1B8SGPYqwztCA8dV/auQ1eFIW6mJDxDgWAM6bqCNvGZ
         pzIxrzw1+hJe+MM0L66ojrAVTHU+cvrMNdtX2vSx1J3YMbYvcjb2CQjurbrgv3VoNa4j
         g1c3NH4linwLD0Cn0bfM5Ke6V2ElBQlihz0sbn3j0ynuB2YIM9SMEGg4oZBMoOML9dpZ
         Z5w5Snvsw3TX4hr4QxWZntLSd+YuydDAD6hkNLlnCArbdwfMH+48EN1TL6nLT5km5E37
         EnFW8vIl6nC+ZY3HrfrLFvFDWyHPaU2rQSnbLRgkg5q5M3byvPTMBjrAlqxvOtSHFSur
         dq2w==
X-Forwarded-Encrypted: i=1; AL+hErFWfvQphEbWauFU/09rdyywVKElDCCGmsYtZel2Iye+DZ7kLlBC+rZzhnCzMS75si5bEe2BiHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i04UnmjdatfYk7eE58JyQhxdkfDNR9GiDEv73/K+FeIhnIvXL
	HtKwEjxUyYJXDt7+5wG+nqqjDBxb1z4cpLFfEnCYLu4MQrm93sHyQIh2
X-Gm-Gg: AYBFou3tNRbX8bU47bm6aKNd80hOposDXWO6nnV0qdOY2rG0ErnvTd9SsNyNuo+Eqmw
	72xk7ZNA+Ik5kyHnm3UhgExmluso2L7acC8HgBBj9GS7Tu+RxRIb4q4uOyqdYtubRDEZNNJchNO
	z9behBLc7a7d8sodb0PSI159zvJEuZ1fTKjExZIrrB+a63ZXT+gCswYwFsm1CGuz/DaDJSvVbwE
	K0CKMSdQNbQSZOcLx1MrVC59CHS7lxRr1hmlPUMyT7JRtTw1HEnyTHbbjEixAgRZpK7WmUkt4Iq
	Y902LQa9ETEV+nDANcHTefulsLMgfUCeqr+YUbiZvA/ilEcu0E7xxVw8USGssVBxd9i3yrZ5+ae
	uztF4JZKHt51/NQjtt2CySTJY6Qfa0FV+BXDM6KM3GDKsZJi0wyoJISmiAW2Kc8OPHv4B4iIcA+
	xldRMkIasRy+0UJiU6DWdoZ+fe6OunW58KMe7e6czA7d/Gz4veeHrluphjAPwK9zdyPTcGfaxuJ
	+tWsO+qO13YfMLi/HOoCqacYMVk5nX9kfvEUl/Ak/oGQvgVJhlh0FnDrR93j48WLKjjcszKfMW+
	qS8yT8ro5FmNhze7bdlkC91QjhxuaSCx21VnHnK+/Rm5Lt62ExQ6cSIdZWsE1efi1sfRgZqjf2/
	0EtctKoTBUUAU1bsHHCAgn12lkX/kUVljsg==
X-Received: by 2002:a17:902:db04:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ee0dc2a5bfmr60623615ad.38.1794682228921;
        Sat, 14 Nov 2026 10:50:28 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c980sm22473765ad.25.2026.11.14.10.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:50:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:50:24 +0000
Message-Id: <DMV5R4A5D4UE.CX5X9T3GM3GL@gmail.com>
Cc: "Michal Luczaj" <mhal@rbox.co>, <virtualization@lists.linux.dev>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH net v6 0/2] vsock/bpf: fix recvmsg deadlock and
 zero-length, OOB, errqueue reads
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <jrmmhm.kernel@eldare.de>, "Stefano Garzarella" <sgarzare@redhat.com>,
 "Bobby Eshleman" <bobbyeshleman@meta.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Alexei
 Starovoitov" <ast@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>
In-Reply-To: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>

On Sat Nov 14, 2026 at 11:59 AM UTC, Jerome Mohm via B4 Relay wrote:
> On a vsock socket in a sockmap, a blocking recv() deadlocks with the
> virtio delivery worker and stops all vsock rx on that worker, and
> zero-length, MSG_OOB and MSG_ERRQUEUE reads spin with the lock held,
> wait, or consume stream bytes. Both come from the commit that added
> sockmap support. Patch 1 hands those reads to __vsock_recvmsg(), and
> patch 2 releases the lock around the wait and makes the wait loop.
>
> The deadlock and the MSG_ERRQUEUE case were found with the help of
> Anthropic's Claude, with Stefano adding the stream-byte part; the other
> cases come from the netdev Sashiko reviews and Alexei. The reproducers
> are available on request.
>
> Changes in v6:
> - Split into two patches, the zero-length, MSG_OOB and MSG_ERRQUEUE
>   early return first, as Stefano preferred; the deadlock fix does not
>   need it. This is the reverse of the v3 and v4 order, and 2/2 no
>   longer argues for one patch.
> - 2/2: check the transport in the wait loop before the data, so a
>   reader that wakes after a failed connect() has dropped the transport
>   no longer calls the data check, which warns (netdev Sashiko review).
>   I check the transport instead of swapping the two tests because
>   hv_sock reports the peer's FIN from its has_data() callback. The
>   WARN_ON_ONCE() at the top of vsock_bpf_recvmsg() is unchanged.
> - 2/2: reword the comment above vsock_rx_done() (Sashiko).
> - 2/2: leave Sashiko's signal-and-timeout point as is: such a reader
>   gets -EAGAIN where a native one gets -EINTR (see my v5 reply).
> - Rebase onto current net.
> - Link to v5: https://patch.msgid.link/20261109-kbh3-1-022-fix-v2-v5-1-4d=
9af04f0fad@eldare.de

thanks. lgtm.
