Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795757152;
	b=bFelmRMNe0HSNGKWz4HdbE8cdI8uIfdK1ocaiQlgR3KE1guqaAX7jDEZ0WkoBP4xbvIv
	 WDHGo9cvnYx7/vGBJUtIRsLvn43SI3bEuB64terVI4sPq1Pq4bq/vworrj/ZnNaqDyoQM
	 mg3csbP0/OytKmkrI/NHyAJQGPRbGNqSaXdkKpGrrStR8C/zYsmf4Rgp6pDfFeMwTOrgO
	 KqNYTkLLmibFfQs00hRomCQoRkOzLky8H0+fepe2u012cOPQAUk7qF1M9EtbjBlfv0ZTH
	 faHnleZBCjhH2rCyQGi6iqxS/eGMUIdDALmGncDObRzCprzOjMoBwpnslt6ooNY4Fvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8zadYnSLJC4oWK4KEqW/pDBGl06U5XfACnUZ/V8R80A=;
	b=EHcJZP/Sz5ezxsF64NPGDa+8r+8q/au2H0KIOsDbEvIG9oLxlhyR1sjt3vnc0p3I8LGB
	 ne0EPxDf+iQNXUaYfhweNa0FJpBj46OUNRRq8D3jt3K6Tp9kAhxAPQ3abfozrmsL9Fexv
	 WLOJ47b7wskrZnB7KnVn7hbK4M7IFQjyvjLY5min/WVsWw2QYpUpwzqZP5AfuPJagMfAV
	 izmDY40uoTYM9KZyp+jPpY0G1kf9717HprMfIrJvNJ5wFrICobBYerEIMzNcV/CwagsSg
	 zCtA3BJzuodz0jhbImeoGymgGhP5TxoGCO1tLPGXB++4EAsCevb3tquHtqRRK4pdd5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lCV/0I8i";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B79606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCV/0I8i
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677bc4704cbso8968513d50.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795757151; cv=none;
        d=google.com; s=arc-20260327;
        b=BHV5it/aE1cHUFmxRCoaYgwc5uxGcL5+jMMS7AkAF7pr/va+Ao7w1+ogDKKlr9Ovmi
         PoM7211aQ14NGGP/7fbFztRnl6I7886MKWbmFdZ16eAuShfeM22J6gqOof502x3EfIQk
         1iclQeI95pL3F68nSpWZENh9OFkw6pGSQkiJR4KsXa+uI2y44r1OTUt6CWnM0/rjI4kJ
         okwIlRnN6vHGuASvid3+io4K7fWdBJWhz9kc35oQKUdFqxu5SHXCGSRyQQk6jhG83BO/
         lQzAZ6J3hNlUJst9REB+C/AjtIS3SIzGopz+5pV9Vu571FtV5aCay8E9imxYgUaqXkVw
         B/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8zadYnSLJC4oWK4KEqW/pDBGl06U5XfACnUZ/V8R80A=;
        fh=/OR1/1Fpsr1s1gc20hWQW3QPGDBSy/4KfYPesF7lvSo=;
        b=U6/gVMbTu8//ZZd5iLcVeIMEADdIPcr0YJgQ8aE9/PybGN2L3Mq96IXpHF2jeWjppH
         cxcdA4CahLN1Xs0bM/1qByg5YtDL8Q9t4Ghhl3VSbZ4zwiuBJCFi4RY5TGrikQSWcIK3
         DFRkQLeiqh5gimYZGo7kuX6GDgyZZnL5V6GC+6vnY100QVM8/LPM+nAbumCjQq+hacq8
         F2UMEayjbylQssrwlT6pd65VRjJoKvGS2iA4na8erbtHHksM2fvro2WI8X3YM9A/9fHf
         kfjaFBfaefGqXkNDN5lckSwL0t89u8VGczDVG0Ys+GbJpk8sFGRghvp9+vldJUTdD917
         /Y6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757151; x=1796361951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zadYnSLJC4oWK4KEqW/pDBGl06U5XfACnUZ/V8R80A=;
        b=lCV/0I8isypgadQcogTLtoCz/UVpKWFG0smPfTyt5A70tqt6zcF2BuGNrAz29vTJKZ
         Rk9DYHrTsfhFQVbp3hTzdcLzuu8K4NSWq9vBGrITpSyrDXj0rX+F+YmL7POqZhYj+29v
         DXWreCFIhMQOL6aJynZbDlkCNBYaQMpSXCNGHSakZSmEtjQ2AsJKa2dnfZGyWmdkoqCC
         c2vuRXV/eq2CSXdycCVKlJJ6Ba3Mkyt9s/tJmmcGsaRXtsSpMfTfJxR6zAg4TggIOjvA
         mZMO8d8pnLoYTcCjS3KX5sfi712uuLwPFjIqh8i+4OqtFy5jWTAOwX2eALsA8P5LKjAr
         YpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757151; x=1796361951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zadYnSLJC4oWK4KEqW/pDBGl06U5XfACnUZ/V8R80A=;
        b=H2jjsulBiHfsy690kin8zJou50Grmo7fir8mjcPuIoCGOu+DmWuk+4gzfnX0hy5uhL
         jI05T1H/RgzxYZJxxDsnBev8RZEtAJGZBSzhIYhWbnqLB5Lr6pRRkkyYPwx80MYjqZ2U
         sMZkB9T6oaORVLZjFrGuSQgKYx+QJdgldrO4DJojZtLFQkUm4gGMX0GhY+Ion03i6KVS
         u3p9VEDWcUF73mV6v1hNr/mAEU5sUYBlv8ocVjCX9/0fl7lcJw8BD/G0Kc6OBwgHyPEI
         ib/tVEZ88FmvbM3/EhtJuxfvCsHw4IjYq6kThQ++cFv8DrEnXA0TzFXlE/ExxxzgzIU7
         QHQg==
X-Forwarded-Encrypted: i=1; AL+hErFfxQgsNU81IFGg1mE6H6TvDHX8f20zfpBlYMKw2SR3cA0d2OMplfcy5nADVG+8CBLCSwlvLT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XvY9ZLr26maGRUwgHUInW2jYp0rmm9Isc9ogIF3lqR72z2rL8
	L6ArpW0tQKIIT2OMDH43UAR/N3uT8eP/2vNE0MdwVVAFJAfFZT9/lT2Iq/vY+i566nayYJJp35I
	xI1VclGhVlmCu9yzZSv+sCaOBTn3DHZ0=
X-Gm-Gg: AZFdTZeSOl2tRh7KUPhhXeDti4RfXEWctx0KEoZBEQ4siibH13+qIRiMvrlWyDGqVIo
	kDq7TBkxmyxYRHwxMghmfw77Wrr/4znLNgLnAtn0Erw6TnTYEBn827TbvhipY58kp9cSXYWrEb7
	2saH+sgVzq+o9fCNP5f0ESg6gm4B+PPZzbPnIdD9xsiAup8jCj3vzY+B6A9HM87/RTUwnhZJav5
	kC8dEdVO6pAqXxlE0N/k3A71rQmM0JbgGR+naCNSAWFLN6F93ChEPPelD3b1Mm0SMRy2a2RPQSs
	vODKfrjTWRLFpvy10sH+boAAufWuX2D5Hjkw8WmfcGo8dMNTP6r/QwM0kKWMUe4znJaAITBkiG6
	Tgbt3fAVXWNZd9hA3FayiVlaLV409jDuR9XYetX2kqkWKXfrY2iyEPpkE3Jk5xAaOF/iXyRXdVQ
	PsJovLzsxXPNZ3SOSAxA==
X-Received: by 2002:a05:690e:151a:b0:67d:ea44:eed0 with SMTP id
 956f58d0204a3-67df43f342amr5944468d50.31.1795757151192; Thu, 26 Nov 2026
 21:25:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127033534.175-1-sunyiqi2@huawei.com> <179575078181.3294.2500218795739226970@kernel.org>
In-Reply-To: <179575078181.3294.2500218795739226970@kernel.org>
From: Charles Research <trilobyte777@gmail.com>
Date: Fri, 27 Nov 2026 00:25:39 -0500
X-Gm-Features: Aa3M54pM9aMwykZrmzdwnraMcKFs8w_Vab-aMEV-uj23ITBp-ElUf2aBFcAeAHE
Message-ID: <CAPS2u-V_bfyuZFwqB8KOswp8YT4EjYiO8Oj+xUjh+veyNGTpdA@mail.gmail.com>
Subject: Re: [PATCH net] sctp: validate Cookie Preservative in the first pass
To: netdev-bot+sinfo@kernel.org
Cc: Sun Yiqi <sunyiqi2@huawei.com>, netdev@vger.kernel.org, linux-sctp@vger.kernel.org, 
	marcelo.leitner@gmail.com, lucien.xin@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, willemb@google.com, 
	horms@kernel.org, luoxiaoxing@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the missing discovery/runtime context:

I originally found the Cookie Preservative length issue during
AI-assisted/manual review of the SCTP fixed-format parameter
validation following the Adaptation Indication issue, and then
independently reproduced it at runtime in an owned KVM/QEMU
environment.

The malformed Cookie Preservative parameter was accepted on the
unpatched kernel in both header-only and overlong forms. The
header-only case causes sctp_process_param() to read
lifespan_increment beyond the declared parameter and use that value
when calculating the State Cookie lifetime returned to the peer.

For my July 29 testing, the unpatched kernel accepted both malformed
forms. With the original validation patch applied, both malformed
forms were rejected while the baseline and valid eight-byte Cookie
Preservative controls continued to pass.

Sun's patch moves the validation into the first parameter walk, which
addresses the additional path where the second verification pass can
return before all parameters are checked.

Since this is a follow up on the Cookie Preservative issue I
originally reported and runtime-tested in the linked July patch,
please feel free to add Reported-by: Charles Vosburgh
<trilobyte777@gmail.com>.

Thanks,
Charles

On Thu, Nov 26, 2026 at 10:39=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
