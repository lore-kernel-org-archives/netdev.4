Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429961;
	b=1qHWS6aYYiL6m0/lpX453OJzNHnQpRYJ2aYBr65xXVL+mBgUXnNxktZWqBRoTaKN+z19
	 IKhgYGWLG8yftdyYnDfOxDuDaCKNZxiDV1UnNin08VtLUXN1l+SQizgi0FTTSPop/Cah5
	 gFeo36j1DR8yhAhlAtijGTF+h+lX+cIpmkKpL7mxdvuon4O6Kn3iRK6Orkw5jqi0fPYKK
	 RHM6aqiyDAdpL2ZmTN3JgyNMvtNZk22kzsuSGnUh96MAPxLysSMxg7/8TM9iv35ZsEiS7
	 9eiBDCw6brpF2dO6phqTC9SSNrahQ5cy/0daXTZFiK2B4EDBd1p1ctbd+ekHnq9dmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429961;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=AAHyyR+oHvHgttc3lKAsUTn7cdocpc98yIJ9vy+/iRAvJqX9SxDuOoXdzdBXaPMYkIlf
	 X6spMd6XHHovH+6INVgtfRumUJ+kpUfGFRVzQQuV7/KA2G4O2Xc3u38yN0eCTevtz64cD
	 Qe71hBaHkIW23Utgw4z+1VfFn+/wFV4Wi4o7G4sj5hvkJw0tqUl/8lsUFLOU57PNl3w0E
	 zDdFFih5zSS8Q3NE1YIBIRn1wdWh/MsWmcLhXwQEMLCKYPj7ik3gmbSUcXzc5sfY2jjfw
	 nUr8vCKzPQqvJE0FGytGqKqYci72pmZedfvPsvJlHagSU4seqCiwesrS5QM60OhTqJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG4ubN9J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FCE606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG4ubN9J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80241F000CF;
	Mon, 23 Nov 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429960;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oG4ubN9JuKfZZJSskX6QXQ/5cWOfWB8g/2iIgvD59JS4IUK8rZnLMY9nAdnQ3wf+D
	 wfVDmU2/KE2tk9U0AFeaJN7CjhDappemRjWIbdv1QAaE7RY+fTDL76NcUogeJCUER1
	 Y0QjEjZuoSPR14LYdI3M6aySMLlNvMLsifIuLrML3ZkOk/duA7yW6xDbl8zc0Gu3HZ
	 fmZ6AUjI0wUqmGF/Oe+e9KgcZcADppvmaV+f1vyWJXh3PPZ04ferAt1ffv2VEmfJKK
	 f+Klmw2qz4gnq2hAB8sLmZcq8YFMHisWInfl1WdPVhRwaqNJMY42t3d2wWi/FZz3al
	 4E3u15oZABJBw==
From: netdev-bot+sinfo@kernel.org
To: b.lane130@outlook.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: octeon_mgmt: Add cleanup operations for
 octeon_mgmt_init_phy()
Date: Mon, 23 Nov 2026 10:32:39 +0000
Message-ID: <179542995928.3294.2075171741223144851@kernel.org>
In-Reply-To: =?utf-8?q?=3CBN8PR06MB61774294C2C7961C2D8A4923A4452=40BN8PR06MB?=
 =?utf-8?q?6177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CBN8PR06MB61774294C2C7961C2D8A4923A4452=40BN8PR06MB6?=
 =?utf-8?q?177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
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

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
