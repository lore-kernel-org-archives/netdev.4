Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471290;
	b=iLNoxCjsL0ac6NhDXUHAZY30T4RSf3BgRfzMD9jupiTNVJqNOSgX0mUfvyxSPoRBKiGE
	 COSl7jYeTvfkLEZcr9Lg3UcjLe+UuaTmQvoqZsIdhkf1tyIFv4+14oOlUpQSI72lVT5NN
	 v2lwnHF/E1pgk3eHSL/cL5N+iKZ9BCJTQe5zV8+TdruhTyE05wd+1NPwvQJ1ygjV9r4BP
	 vb6o4FOPw7rBnUfQRhaf/QqeJhKx626B68vZpr4TWzqLhmFMlg6EzZYzCVLBUrOji/Std
	 HFDgB1qMJmhZ8UbYCo5dHYMCAmPnpv1l3zY5PVNth6J+hcpBcL5Kg3WG80Dj+achiJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=srL4Uf6AX26Xr4iCAP6zHkN1OE8a5FhQcDs//2mI1Q8=;
	b=5n6gpEftEf6Uqjd5VO6pdZrF1GlB6aIH0oiz2ZYIko1x3kkMdD1e1d2NcUagpgRVjfJ3
	 mO4MrUCvlIiC/6d2fTwUlOxSz2nDt3YV+r3beU8O1j96oLeXDv3LP06fW2DuY+6u2UoO0
	 U5cw2aLrR2bfW4Dj0Hdd9FttTrpq0mQ2YYWxGBsoN693jYw8043yjgcCmTrFN02Cv1pXd
	 QeMeR6Y0+Hk/qYK70epwxtJTsYNZ0XwwEOZenhm36u+vcGURCTF1aAE58fYPRKR166Plb
	 aLXpkUFa30aFXq6mWMtZP/5slIJFJj0mCdZndepL/BQgjRO4eAYrxTT/Ecy+crVY08w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bIEcMOri;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4C606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E4C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bIEcMOri
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4adae187d94so2581273fac.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795471289; cv=none;
        d=google.com; s=arc-20260327;
        b=b01dF/aRfm8rvnbXHyDFaYyZLI13zPfhTDQTmMM8ucd09W6sm+aL0mA3PTRHXJWpDh
         UytiJuMjrqtza8gF0A20eVm2tjAF7Aa+OFQqGT8F443JOMMXQxHwTe8JwSlakuJjEtO0
         wX6IQN8p9wo7EnEa0vQnYQhLv2Qdh/qbdXpO+6g9Wc8GJjpZ+BwxPOlqiyGgerSkCgXP
         nKl3ployNsW3jO4stTbTGn3e/xhGWEP6N/dP96hBkeTuWeIutX8GgGZHUIbEHstx5WRj
         7lROBly5ke8biw58U4zk7UdE2U7lAv1FU8tJzD1VeNFInp9kzHjviD9f2wpUrAnYkSFN
         KT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=srL4Uf6AX26Xr4iCAP6zHkN1OE8a5FhQcDs//2mI1Q8=;
        fh=WiRJ1poBfOo5QwsKnXd9XP8mbDsyRcvCUhOQN88dpe4=;
        b=rFlhIl+vuxLSrhBG/EAc1RNoC4R7B+pFfDTwtah1EVfFtwUDKHWWh6iceFvG1KcHeg
         uppBf/7i0izAhU4aI4KH7fkvPruanLe8RD1nKRIwY1ov8xIsau+/k++HOO7UlrpvFTRR
         wca8XCD9LfT00UqZbF3Q78oBu3SiEocXkpoT+jtNaVh8Wa/WQ60/XCmQzvZtnjqAyJTh
         DrvSEO7UD/tIeWdmokcSnYnpyvGQWYqpKrhGCArFbgSVwSPAFogCE+LfADgqr1f5R5SV
         83TCbcLxoF+XobxrE5WQPqPso0foAtjJeaQg5vgEszUTEBg499EqYfzyj/nfBY4RoeQC
         Cy1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795471289; x=1796076089; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srL4Uf6AX26Xr4iCAP6zHkN1OE8a5FhQcDs//2mI1Q8=;
        b=bIEcMOri8Aax8dKFPrgYNg8wJhG1TdHlstGt2MlCyltgaYxCPE3njcf/ibhUFjv9+A
         DUCiQLx8Ue8lqs8APjUUIua4gZUO8hcQX5Mpziqka8UfmD+frjU+gJD+i+bF5k7RHgwj
         fpdDp2HDYwI0VfSnwrxLMhUzCsK58c2MIKdK56m2LP31pTpIPMaOGEdrx/LC/YAxGnRV
         xDNA95uN/5YkxdEZ6dQjD3YfWy3iBL1pEQc/bRHawTjj21LlnI30bfI7XWeA5oSCgrC5
         inFIAx1nx0xqQpVBsutU31JvUAm5Z3V0Qg87HKJTPqRxxFl8nRb+b27K2AMX0xRg9Dej
         aBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471289; x=1796076089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srL4Uf6AX26Xr4iCAP6zHkN1OE8a5FhQcDs//2mI1Q8=;
        b=eK9Qtm/PeYg9N8LdjCsErRWW6UUoOtE3INlYbBJZUqTDYyI7L73WUJRBqh5E3D9DhE
         /ppzQ1B6qSYTXmZBuVXTBo0cuLUs0VIxnFz2MUuuHXNajVpIXKQ83xWMm3FJBoSnpS3o
         ZrHRFlpPQ0vfxxtSi//x5u7950VrZ1bVueqTod4b4FHyWtOJXfgHluXfS5H+I9YbA+u+
         AYaumkvv77xtUSE+jEpYdMcMAeIHeR8TicGsZltRsMklxIHFR0ZdujnQvuJEqPNsYn8V
         YOteJk7U9aDx/v2WCCHVjsHO56QSSHPyoDH0KSj8Qy9IyHGiDC3Pqr64XJMmEgE753ba
         amdA==
X-Gm-Message-State: APuU4Z/ac8k2/4RZ8Tzv86hrtBY2x4Qwo0a/1cj5J6KqPFtd6/9MMg5U
	peHlWJp3zATE4koSlPuChK+HQF9ddkYJsVke8NChvhSxEp04a9YKxyUGv+McTJbSgUTmkhAFcmj
	1schUIdIozs0YUTzCAUfoPC5njKty9Mkaw5fksan9DogM97id10LMdpRwUg==
X-Gm-Gg: AZFdTZebCUtCmbvjyQWVvKppPbYlyRnWCoH8FExwHe7rX/zPDJwuWUUmsR255l5NXE7
	QNkCJGC/76JZ48IYaXx+bah7vbHJbNKcKSE+dItJBIgdSYVPbzA4As6xmQrq1XAetrW2TrpwFkR
	7cOO2vUTJum5Ex4eQGT/lKc3adwJQt+f+fO2mZ5yCEKpNRLgezqI4V6Saw4kLR86j5mSDTrfKpP
	CSTKyt5+XttuI8hfdieddbmHzrsBUYl6JnCAEvZb5JSjftfLiFtz9szPwLn0SHr9/2JZ5UlHcIm
	jC3NZkXh+uch1XIRu28je3DF53hQ381R0BAxp5N6cWUY+GDYc4RiV43V+vSJBYWRg+5SwqziTYK
	ANGCpg39opJGwvWTUGMtXOLgbNbTIpcTnpYtjTpWOx9BDsVPw3EvFZf22gfZY3CMZ7HARU6I=
X-Received: by 2002:a05:6871:60c:b0:475:a153:2dce with SMTP id
 586e51a60fabf-4bc84926567mr11531088fac.36.1795471288917; Mon, 23 Nov 2026
 14:01:28 -0800 (PST)
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
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com> <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
In-Reply-To: <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 23 Nov 2026 22:01:17 +0000
X-Gm-Features: Aa3M54rB6Tkjt_a_xBRCBKw7WSvCOL2uVv3n24p_DPRCDrCGO9kKs27p19qzjqs
Message-ID: <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Alexander Duyck <alexander.duyck@gmail.com>
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

On Mon, 2026-11-23, Alexander H Duyck wrote:
> For example, one recent one I saw was an issue on the Tx side where
> an outgoing XDP program was modifying the frame and actually not
> updating the pseudoheader checksum. As a result it was breaking Tx
> checksum offloads for NICs that were using the HW_CSUM that used
> that checksum header. We could have fixed it by forcing all the
> drivers to recalculate the pseudo-header checksum, but instead we
> pushed back on the program that was making that change.

Thank you for the explanation, Alex.

On Tx the checksum is in the frame, so the program can fix it. On Rx
the program can't touch skb->csum at all, so there is nothing to push
back on.

> The point is you are fixing things for your use case, but anybody
> who is using the CHECKSUM_COMPLETE to compute the checksum on the
> frames and using XDP without changing the frames will see this as a
> significant performance regression.

Without GCS, TCP and UDP still get CHECKSUM_UNNECESSARY, same as
E810. GCS only came in v6.15, so this just puts E830 with XDP back
to where it was.

The cases I can think of that are truly impacted are IPv6 with
extension headers, and UDP tunnels that the NIC does not parse and
that have a zero outer checksum. These fall back to software
checksum.

And programs that do change the frame are worse off today. Every
packet gets summed again in software, plus the "hw csum failure".

I don't see a fix that meets all of these:

1. It is small enough and can be backported to stable.
2. It fixes the problem fully. We could drop CHECKSUM_COMPLETE only
   when the program moved data or data_end, but some in-place
   writes, e.g. NAT or the IPv6 hop limit, would still trigger
   "hw csum failure". IMO that brings more problems.
3. It keeps CHECKSUM_COMPLETE for programs that do not change the
   frame. But that looks like a bigger change, which doesn't fit
   net.

If you have one, I am happy to take it. Otherwise, as I understand
it, the choice is between:

1. A performance regression for some programs, but no "hw csum
   failure".
2. No regression for those programs, but "hw csum failure" stays
   for programs that change the frame.

I would like to know how the community normally decides between
these.
