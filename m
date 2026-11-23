Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432360;
	b=kb7RHZYw9U+efhFFXh1f9LZUpaYbi0bs5c1cXG/aTgJ8Ca+lwmQv5cyhM9AqiCxTFTFL
	 A0o2Et1+LiHDLn4qEGtG0ke0w9FXtuv1IR2VJKIuY9bej/Uz/k8LXFxKksjOxw0BBANjr
	 Z7gfm2UoHL6xL6qwfgBH/iV1Pl+82Vwp7a4EXfwSy7UvF6YoUboin2c8+K1bbSMIGupTi
	 zUfU1pWInBjpuTuGCz0v92KHoEWfnomxhGIQR5AYrxxEnnWeBKqE1fJsb0itRjnnpBEE4
	 60IHWwh1c8iox65vK4TAz37eiINRyjzvxsfhgnzwWZPpexF2nCl5qSlMvKwB4j02R8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432360;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=aFJ3mif1KYOZC9szErZjKSWAjL/WOVH8T0DMTdzWmhRiSVJInyvzPS8bcXXlTJHMra5N
	 spHMFf0hWHnNHl5/U800yGd1a4p4vy09emOBIgOFNDKAh1v7kn/4Qocox3Xg840Zz0iqK
	 cA72eLw/DFsIqtI+JtH8eM9EqarfAhYZtf2NbiQvAlxQTrHp65h7310HMkgUdRkzija/5
	 eBzpTgJ4erU6KV/Uqdc4GI7rr5eBg/GocRGMkZDoE13EKflQVRhFkj9bJpVbfU638gExx
	 uuvuhkL2tvAg02z+aS++ba973SojNf1ni6Na08jxq5nqkaBIFY8Q8scGPiGk308UwXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oF04sU9A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8D606A32A;
	Mon, 23 Nov 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oF04sU9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DA41F000D0;
	Mon, 23 Nov 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432360;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oF04sU9Ae89DHMAwDnkHi10HDUt/amyDLopscy7ajZ8YKVd/9cE5KkBcw3TnCfuwk
	 /j+keZxVpfxwxUl34eu+0mCdbw0bRR+hNwH518pW4i5ceTjS0ScCERTnBgWkk8mZHi
	 PAcwCb0pFp+w0zbWrhuxAvL4xoCrXGFRtASaaMZeESYxQs6Bh1Z6WtVGR2tSGdvyPQ
	 +8lxWKa/8toQBaSJq8upxncaar8BPrAwOmjWhZb+iU3WhtjYBRIcN4TYQ9WsDaqRhY
	 nXUFHMPHueeiEPSIRasbIz3s+AzeaMgxUFI73qgMagwnVlHxZ7eX+EviAttlm+pTf9
	 5BJ36XhlMDj9g==
From: netdev-bot+sinfo@kernel.org
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH v2] net: dsa: mt7530: disable the power rails on setup failure
Date: Mon, 23 Nov 2026 11:12:38 +0000
Message-ID: <179543235894.3294.8827397951204336522@kernel.org>
In-Reply-To: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
