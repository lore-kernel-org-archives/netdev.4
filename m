Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473807;
	b=pbgfbz2XjcRArywlur7Xy84ECXx+1dAjoUwyyW3buHzk/HlETl6hVfRQ1d0gQefr5fLA
	 j+C9SJGVPBSCkm5iGx3fwEbDFxCR7TGA/2M/hAOsc8rZqHa/0eBFlvd6UkE4ygX5tWVm9
	 3XwonIcm8vSJYwXFLaNXDI2ypUSZxvvLlZLO+rkW3H59MQrQNbIDpWBlZp3fghAjSdI0C
	 3yf14y1NdpbZ9fp7bbgME1fir+aVB+CgWcKxwhiK/GAeWbZM4olzxdhOlGG/6wHtnqRYQ
	 zxVAa4undJtr1QqjHYt5G7bUQsA1PecP+t7kK+B69Liw359hKDpMK+UTUlzawe+S9uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KoaCT3k2u+3gdASFJNpsPM+Yd03fFCalQiVgHKeiTvs=;
	b=QITlwHd8WPM89W0pOvsFCJ/yuSopHqTw2GEN9aC+jYY/oJKzaEkKnFFDyZxr/XLm8zj0
	 DaiqZY2QJpdhm75wL2RwWssBIgE7mlKf+3eLL7reY70mWIgJmL9kVB80B8QgL/doSXNde
	 US8UC+VkCJdvQakY3MNRaEHAcLNRJ3faBAerriAJFaDCpm802dYVIqIqB06Vz6cumsnu0
	 dTpbapZZXb462kVbWnCuzg5TSEK7qseGhDikbA9nCUyC/ereM6RC7JW43lp3yqiofhwJU
	 CInBjcIaipha6gmEBnyyqkDtl9BCsU5a0dfNLbgPhAQsy38cbAZR89fueMleyzI93/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdcEEl5u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B9606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdcEEl5u
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so49730135e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:43:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795473806; cv=none;
        d=google.com; s=arc-20260327;
        b=hHv7Ed9nxxkWVmAxqxrc55VRi6dmVfqr+d04s4jGz8d16qzKmPNiT/XVLgBgVW0iDT
         IVqDbTrAglwBxUzB1JnXgsq2p4wO0ClJMBhOYjaZwFh8xULGHycTqL18A3YtX2UaIDfC
         QZneLiC3RTF099hFuSrpc8NpJH1NcAWWvv//xIPzg+ifeXbYwWmJ6gJWb6HM1xXsac2Y
         0Olkcao+CEr7aINtR+7RPmvZnvf5A+iE860ebBNfw0DfvgbEf/juS9NOLHpd6X9b+4Eg
         gYuPwXtzyzPScBUHfZIx9O3ewRlR8RhwmmYbA1JiZ2ZOUaeObPEBnPvZWV8RXgEAH+Jx
         gQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KoaCT3k2u+3gdASFJNpsPM+Yd03fFCalQiVgHKeiTvs=;
        fh=t9iI5b544YLHtYV/o6E42+ujyuAx2KYxd2PpjUSf49Q=;
        b=nlvtSRuKL+m4bUv0zjdTh9bfATSDb+8xlacFcXgjVM6bzHvU9jWZUykxM0yGyX8PHi
         XTU4M0/MjeO77GxvEmFk2IAyI5/t9P6QMWpinN9U6PE/msyg/xiPB/wnUUlH5UNFc/t3
         WWHu2YK1BgA4k7E4ij0+4PRArR107Lk9ZuWYE383TCfO5BUOB9QR8Iy2Gjbkq+ynJJM4
         e7sEZw+u876aIDW4q/C8X41PFDcuB9wGN3xDDE4Qdr834dmOYMb+TgEZ67wdM4P8C1hh
         dWAwdQ+Ub5GfbgcYW9wycBZzPr3w0QSqSEGhFnI3Fcsp1xGim1XLKSCwtO0NS8a99/RV
         f+KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473806; x=1796078606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoaCT3k2u+3gdASFJNpsPM+Yd03fFCalQiVgHKeiTvs=;
        b=pdcEEl5ufh7xWaqQYl8dtJCQdMuE5KBoSI3trvQ/f0bmwn1JpZAnxsxu1Chz32bpFm
         ArXNkVmzAyemCB38m+zTfJTjHRt9L+1Pp6Tj2yjiT8gwHlu6CKk2RD+wPM2BgoII+NhB
         KQrZclBG9FbjUdxMs4+22BvMav4BrNter5Ei9SX8ziJm8U0U9OuhTkntghHQ+uSnwFHI
         14C0MmlxVXedI3UC62QZ7LDACnprxY6ycBmc/w2h7VGSswLV0986iGMHwwD0HGnbp699
         2IUya4kyQ38iSoOZe/rlgYmAcreYyGRIQgUsEPTJwLKcLL1MKBaVJJLb/K5dJ9XR6Scj
         CSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473806; x=1796078606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoaCT3k2u+3gdASFJNpsPM+Yd03fFCalQiVgHKeiTvs=;
        b=gGcSsAQhaKb7VTDPCiYvC3dCZ91XT58aSHnMmSQEd8Livv/41TE1WF9LUOdtmqcvPY
         7zzSZzBYwWFXl1LCH9GWejaz4wcTYV7dVqwoh03636H4d5fjzAsGn0T4GAAODKObPWNU
         3vqfNlUU80+qfXRonYX2YnytmHnK/Vz0mFedzE5d7kNApcH+gLqYH/OWDFy93os39MgA
         3oDRFW+mSSmMrScutP1Jxs6pUupAl0Y7Obu5FJT/UzSSPRQR6I/SPsEjYOsOArVUjj8w
         vqgZspagnNnjjJLhEvWYci6QTDgoThle5gh7h9ulCG+QiWLT8ZeZ2pAEUA4ErBJTqk9B
         w2Xg==
X-Gm-Message-State: APuU4Z9gxBCcsXa4s+WRRg+9KUQUqsof9IOeAL1VHDBVxNPbhJFa6ujE
	T6plSIT3JGHSBIR6RVJ2hpds+5nETZeVlOCUrvkhox8rSuIy+I3fKPbBw9/lWhLGmuCReDdBV2k
	++t0S1By/CkgdJsZNh2htfRc3dRdmoDs=
X-Gm-Gg: AZFdTZeni+ZgyY4h5pool3n4ed97xeh13y85pdxaJ2NgXBIQI6jC5lhbPr5GgIurbBh
	HFKdRyrSeF4u/MELMKmRP0tkvbG+iVpX8PmbUx9ctXxjuiJD3TEWS0DgwdBA9ZvO+J0aPdfvGpW
	Jv4v62fQR/NNT4T6iO4y7vxcH/9glphwzJ4P7WJGEqe8kuEj+a1PWlM+V8n4K0PqevcTMg+z+jW
	c7eVYv/2o+eB129dnReA/QWqbsc9me36rtKiAnZCh4IUU213zbsTqr2c0xe5A7noU/ejDyLpWAY
	7DCK4UBXMdc5dB93XUjNw4zQTqXaEh3a2cNHcYdkKtEBq2oHLj6DawwwhSoupcl07lNsqpCFGWs
	XXWYn31YiCuUBbDFS+JEF2gXwqst9q2A+S92au5P9+kbl90aroK+A2UNjMPUgzu5xHGwtL+wsrr
	GM4cWQzB/WyE9CPAaVPTLOSb6Ra4Si88eYJMJOCvclCPQvP2ONT+IZXtWnpqGtJva63reK9qcni
	ps=
X-Received: by 2002:a05:600c:20c:b0:4a2:f58:9a82 with SMTP id
 5b1f17b1804b1-4bb861590abmr246078985e9.13.1795473805423; Mon, 23 Nov 2026
 14:43:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
 <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com> <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
In-Reply-To: <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 23 Nov 2026 14:42:48 -0800
X-Gm-Features: Aa3M54qi82M1DAMMWxrM8C2P0C7XHARA7mgqCdyXPQsvQZsIrQdsx5S-vHEw8KA
Message-ID: <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:01=E2=80=AFPM Tianyi Gao <tianyi@cloudflare.com> =
wrote:
>
> On Mon, 2026-11-23, Alexander H Duyck wrote:
> > For example, one recent one I saw was an issue on the Tx side where
> > an outgoing XDP program was modifying the frame and actually not
> > updating the pseudoheader checksum. As a result it was breaking Tx
> > checksum offloads for NICs that were using the HW_CSUM that used
> > that checksum header. We could have fixed it by forcing all the
> > drivers to recalculate the pseudo-header checksum, but instead we
> > pushed back on the program that was making that change.
>
> Thank you for the explanation, Alex.
>
> On Tx the checksum is in the frame, so the program can fix it. On Rx
> the program can't touch skb->csum at all, so there is nothing to push
> back on.
>
> > The point is you are fixing things for your use case, but anybody
> > who is using the CHECKSUM_COMPLETE to compute the checksum on the
> > frames and using XDP without changing the frames will see this as a
> > significant performance regression.
>
> Without GCS, TCP and UDP still get CHECKSUM_UNNECESSARY, same as
> E810. GCS only came in v6.15, so this just puts E830 with XDP back
> to where it was.
>
> The cases I can think of that are truly impacted are IPv6 with
> extension headers, and UDP tunnels that the NIC does not parse and
> that have a zero outer checksum. These fall back to software
> checksum.
>
> And programs that do change the frame are worse off today. Every
> packet gets summed again in software, plus the "hw csum failure".
>
> I don't see a fix that meets all of these:
>
> 1. It is small enough and can be backported to stable.
> 2. It fixes the problem fully. We could drop CHECKSUM_COMPLETE only
>    when the program moved data or data_end, but some in-place
>    writes, e.g. NAT or the IPv6 hop limit, would still trigger
>    "hw csum failure". IMO that brings more problems.
> 3. It keeps CHECKSUM_COMPLETE for programs that do not change the
>    frame. But that looks like a bigger change, which doesn't fit
>    net.
>
> If you have one, I am happy to take it. Otherwise, as I understand
> it, the choice is between:
>
> 1. A performance regression for some programs, but no "hw csum
>    failure".
> 2. No regression for those programs, but "hw csum failure" stays
>    for programs that change the frame.
>
> I would like to know how the community normally decides between
> these.

The thing is your fix isn't really complete. As I said it is primarily
just addressing your use case and sweeping follow-on issues under the
rug. In the mlx5e case they were disabling the feature via the private
control flag if it was enabled. In the case of your change you are
just disabling it without exposing that it is disabled.

From what I can tell you are just bypassing the checksum complete
logic, but you don't exit out of the function as a result. What
effects is that having on frames that would have been normally
checksum complete? Specifically, is it being treated as though the
frame is unrecognized, or is it falling through into the
CHECKSUM_UNNECESSARY path with all the indications that a tunnel was
still there even though you stripped the header?

The issue is that the driver is making a number of assumptions about
what is there based on what the hardware parsed for headers and such.
With the headers being stripped and/or replaced those aren't correct
anymore. That is why we should probably be looking at dropping more of
the existing logic or forcing a rescan of the packet once the headers
are replaced to update the descriptor data for the skb configuration.
