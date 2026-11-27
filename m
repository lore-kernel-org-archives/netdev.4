Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798088;
	b=PnRsFpAfuykNe6LhuJBUZ2o8pGwiUbKUgK9a6gg4gZRG5lWQwuxq3cdmCEW0vsirLk2b
	 N7lZrc7+1qc9nyogNOj3vuvbaWSFckawpyAMWbUtsrDwhOAQVl+8Vrbrfaj/koLRSgEty
	 zknOaKa3fQm74LP9xVm/z++0h2qhqL/JZQUe93lhSw1OzbpHLh1vB0jgVONdOKwQKfVM4
	 S1aJSvK67+vTozDnN57T4OFWRd9oIB/kJrezGzc+/KCbzAkCdZA6OMDZTwDerYcW3tLaC
	 ztEFPp7bNS66z3wL7HovzLcAYmV4BOuHTZ9IdBIYdwxtqxw6T2X5zUWRnZL1uguqPZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798088;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7D37xDAqg1f0UvU+LKqc64De08N+fkQG5RsOyGwAZ2c=;
	b=5CMyzEiODiYFmGnQn2+OBs2PU2NS7ft6aagxPXDY4xq1xqPUkIy9Y4R1uQiAGYG5Hl6I
	 bDBBfhksZMtGDfQ44r4PFi2dyY+WFnYwzZ/yo+HVJ90vYsBP1CmjRQstdygg7XRaMnmLu
	 AKa1j7+HmLFwVKwSd098UK72Gpbf1ybBXUdXY4JcgdjrMu1wTJt9AQJvmGdermMiyPIr8
	 2elri9DkKkO6wPfyQ0tt5QnRr/+b1788FzAibadhF4AeX7UbUL7xMcTw3gGhedFnCbHEv
	 X28lOxp1DUnS0dOKxk8l5s364kjcCVghJsBaxdqyqE8S8MG1pOpPH7KhcrKms1ThBjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyQS80by;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9EB606A686;
	Fri, 27 Nov 2026 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyQS80by
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7071F00A1B;
	Fri, 27 Nov 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798087;
	bh=7D37xDAqg1f0UvU+LKqc64De08N+fkQG5RsOyGwAZ2c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dyQS80by+2RPZKHL58qUzfxVKocx6QiRODfPulO+p3eA8/ih5jeO8afuSr6HinzNH
	 mttsxjOX0gQYzls7cKZi1+DlNc/7q3Wb+lwIhrcgTGA9DdpZ4CjNtU+2nlkgeFe7d9
	 OtSkn2L29EWkmxrgOG+tW6Z2OjjLTi6DB7T0/MB4S+vVrIyWqfEGBAnasjbXrSLil2
	 8xkIvCfBEFvkatRiBP8tokRhWzV9pXrzxzeC8aDxNzfKvfO9DCfGxTEJsovIw9hlyr
	 PyCE/gO1chJeGpIuO83LFfC35PCw8jDXbNHRNufzkSiPdL2gnsCYd7TSK1dsZkgDI5
	 Zwkh/dboj1kxQ==
Subject: Re: [PATCH net v6 6/8] ptp: ocp: correct the DCF output frequency
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:48:06 +0000
Message-ID: <179579808627.3135.15613874572415965446@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-6-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-6-ahmadexp@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says "A coding assistant helped identify and
  verify the selector mismatch and prepare the regression test and…
- [Low] The commit author is "ahmadexp <ahmadexp@gmail.com>" but the
  Signed-off-by is "Ahmad Byagowi <ahmadexp@gmail.com>".

--

ptp: ocp: correct the DCF output frequency

This commit changes the DCF entry in the ptp_ocp_sma_out[] selector table
in drivers/ptp/ptp_ocp.c from 77000 Hz to 77500 Hz. The output table then
matches the input table and the DPLL frequency list, so requests for the
DCF77 output frequency no longer fail.

> A coding assistant helped identify and verify the selector mismatch and
> prepare the regression test and changelog.

[Severity: Low]
This isn't a bug, but which regression test does this sentence refer to?

The patch only changes one line in drivers/ptp/ptp_ocp.c. No selftest or
KUnit test is added here or elsewhere in the series.

Should the sentence say that the test was only used for out-of-tree
verification? The other option is to submit the test with the series.

> Author: ahmadexp <ahmadexp@gmail.com>
[ ... ]
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
This isn't a bug, but the author name ("ahmadexp") does not match the name
in the Signed-off-by ("Ahmad Byagowi"). The email address is the same in
both.

scripts/checkpatch.pl warns about exactly this case:

    WARN("FROM_SIGN_OFF_MISMATCH",
         "From:/Signed-off-by: email name mismatch: $sob_msg\n");

Could the author identity be updated to match the sign-off? The same
mismatch seems to be present on the other commits in the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com
